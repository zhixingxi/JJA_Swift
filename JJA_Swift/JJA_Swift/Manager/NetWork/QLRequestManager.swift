//
//  QLRequestManager.swift
//  JJA_Swift
//
//  Created by MQL-IT on 2017/6/12.
//  Copyright © 2017年 MQL-IT. All rights reserved.
//  请求层
import Foundation

enum HTTPMethod: String {
    case GET
    case POST
}

/// 请求层 -> 协议
protocol QLRequest {
    var path: String { get }
    
    var method: HTTPMethod { get }
    var parameter: [String: Any] { get }
    
    associatedtype Response: QLDecodable
}
