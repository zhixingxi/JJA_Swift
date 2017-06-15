//
//  HTTPService.swift
//  JJA_Swift
//
//  Created by MQL-IT on 2017/6/14.
//  Copyright © 2017年 MQL-IT. All rights reserved.
//  在这里配置网络请求的信息

import Foundation
import Moya

enum HTTPService {
    case ConfigInfo
    case VertifyCode(String)
    case Register(String, String, String)
    case Login(String, String)
    
}


extension HTTPService: TargetType {
    
    var baseURL: URL {
        return URL(string: "http://122.152.194.233:8080/msg")!
    }
    
    var path: String {
        switch self {
        case .ConfigInfo:
            return "888"
        case .VertifyCode(_):
            return "103"
        case .Register(_,_,_):
            return "100"
        case .Login(_, _):
            return "101"
        }
    }
    
    var method: Moya.Method {
        return .post
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .ConfigInfo:
            return [:]
        case .VertifyCode(let phoneNum):
            return ["mobile": phoneNum]
        case .Register(let phoneNum, let password, let vertifyCode):
            return ["username": phoneNum, "password": password, "code": vertifyCode]
        case .Login(let phoneNum, let password):
            return ["username": phoneNum, "password": password]
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        return URLEncoding.httpBody
    }
    
    var sampleData: Data {
        return "".data(using: .utf8)!
    }
    
    var task: Task {
        return Task.request
    }
    
}
