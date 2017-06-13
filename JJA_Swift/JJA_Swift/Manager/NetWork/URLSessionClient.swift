//
//  URLSessionClient.swift
//  JJA_Swift
//
//  Created by MQL-IT on 2017/6/12.
//  Copyright © 2017年 MQL-IT. All rights reserved.
//  网络层的具体实现

import Foundation

/// 网络层的具体实现, 任意类都可以
struct QLSessionClient: QLClient {
    
    let host = "https://api.onevcat.com"
    
    
    func send<T: QLRequest>(_ r: T, handler: @escaping (T.Response?) -> Void) {
        guard let url = URL(string: host.appending(r.path)) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = r.method.rawValue
        let task = URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let data = data, let res = T.Response.parse(data: data) {
                DispatchQueue.main.async { handler(res) }
            }else {
                    DispatchQueue.main.async { handler(nil) }
            } 
        }
        task.resume()
    }
    
}




/// 本地请求  用于测试 
struct LocalFileClient: QLClient {
    func send<T : QLRequest>(_ r: T, handler: @escaping (T.Response?) -> Void) {
        switch r.path {
        case "/users/onevcat":
            guard let fileURL = Bundle.main.path(forResource: "meng", ofType: "json") else {
                fatalError()
            }
            guard let data = try? Data(contentsOf: URL(fileURLWithPath: fileURL)) else {
                fatalError()
            }
            handler(T.Response.parse(data: data))
        default:
            fatalError("Unknown path")
        }
    }
    
    // 为了满足 `Client` 的要求，实际我们不会发送请求
    let host = ""
}
