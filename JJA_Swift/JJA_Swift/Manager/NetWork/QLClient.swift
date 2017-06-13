//
//  QLClient.swift
//  JJA_Swift
//
//  Created by MQL-IT on 2017/6/12.
//  Copyright © 2017年 MQL-IT. All rights reserved.
//  网络层 -> 网络协议

import Foundation

/// 使用协议的方式定义了 Client。除了 QLSessionClient 以外，还可以使用任意的类型来满足这个协议，并发送请求。这样网络层的具体实现和请求本身就不再相关了
protocol QLClient {
    func send<T: QLRequest>(_ r: T, handler: @escaping (T.Response?) -> Void)
    
    var host: String { get }
    
}
