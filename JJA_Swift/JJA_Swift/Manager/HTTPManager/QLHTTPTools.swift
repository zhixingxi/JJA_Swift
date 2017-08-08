//
//  QLHTTPTools.swift
//  JJA_Swift
//
//  Created by MQL-IT on 2017/6/14.
//  Copyright © 2017年 MQL-IT. All rights reserved.
//  发起网络请求的地方,相当于对网络请求第三方库的再一次封装,方便以后进行第三方库的替换


import Foundation
import Moya
import SwiftyJSON

fileprivate func JSONResponseDataFormatter(_ data: Data) -> Data {
    do {
        let dataAsJSON = try JSONSerialization.jsonObject(with: data)
        let prettyData =  try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
        return prettyData
    } catch {
        return data // fallback to original data if it can't be serialized.
    }
}

class QLHTTPTools {
    
    static let shareInstance: QLHTTPTools = QLHTTPTools()
    
    //App配置信息的model
    var configModel: JJAConfigModel?
    
    
    // 请求头
    class var httpHeaderField: [String: String]? {
        return ["ut": "token"]
    }
    
    //公共参数
    private static var commonParams: [String: Any]? {
        return ["version":AppCommonInfo.appVersion,"plat":"2","type":"1"]
    }

    /// 自定义endPoint
    private static let myEndpointClosure = {(target: HTTPService) -> Endpoint<HTTPService> in
        let defaultEndpoint = MoyaProvider.defaultEndpointMapping(for: target)
            .adding(newParameters: QLHTTPTools.commonParams ?? [:])
            .adding(newHTTPHeaderFields: QLHTTPTools.httpHeaderField ?? [:])
        return defaultEndpoint
        
    }

    // MARK: - 自定义requestClosure 设置请求超时时间
    private static let requestClosure = { (endpoint: Endpoint<HTTPService>, done: @escaping MoyaProvider<HTTPService>.RequestResultClosure) in
        guard var request = endpoint.urlRequest else { return }
        request.timeoutInterval = 30    //设置请求超时时间
        done(.success(request))
    }
    
    //日志插件
    private static let logPlug = NetworkLoggerPlugin(verbose: true, responseDataFormatter: JSONResponseDataFormatter)
    
    fileprivate let provider = MoyaProvider<HTTPService>(endpointClosure:myEndpointClosure, requestClosure:requestClosure, stubClosure: MoyaProvider.neverStub, plugins: [QLHTTPTools.logPlug])
}

extension QLHTTPTools {
    func jja_request(target: HTTPService, successHandle:((JSON) -> Void)?, errorHandle:((Swift.Error) -> Void)?) {
        
        
        provider.request(target) { (result) in
            switch result {
            case let .success(response):
                
                let responseJson = JSON(data: response.data)
                if responseJson["c"].int == 1 {
                    let dJosn = responseJson["d"]
                    if let handler = successHandle {
                        handler(dJosn)
                    }
                } else {
                    DebugLog(message: "c不等于1")
                }
               
            case let .failure(error):
                // 错误回调
                if let handle = errorHandle {
                    handle(error)
                }
            }
        }
        
    }
    
    
    private func handleCode(code: Int?) {
        DebugLog(message: "code is \(code ?? 0), not 1")
    }
    
}



