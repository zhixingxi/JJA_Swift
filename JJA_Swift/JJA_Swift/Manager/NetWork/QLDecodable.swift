//
//  QLDecodable.swift
//  JJA_Swift
//
//  Created by MQL-IT on 2017/6/12.
//  Copyright © 2017年 MQL-IT. All rights reserved.
//  数据解析协议

import Foundation

/// 数据解析协议
protocol QLDecodable {
    static func parse(data: Data) -> Self?
}
