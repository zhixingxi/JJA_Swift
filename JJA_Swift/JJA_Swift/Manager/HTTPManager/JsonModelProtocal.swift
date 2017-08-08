//
//  JsonModelProtocal.swift
//  JJA_Swift
//
//  Created by MQL-IT on 2017/6/14.
//  Copyright © 2017年 MQL-IT. All rights reserved.
//  json转model协议
//  第三方解析库到源代码的桥梁, 相当于对第三方库的再次封装, 方便以后进行第三方库的替换

import Foundation
import HandyJSON
import SwiftyJSON
protocol JsonModelProtocal: HandyJSON {
    
    static func jja_prase(jsonData: JSON) -> Self?
}

extension JsonModelProtocal {
    //单个model转换
    static func jja_prase<T:JsonModelProtocal>(jsonData: JSON) -> T? {
        let str = jsonData.rawString()
        return T.deserialize(from: str)
    }
    
    // model数组转换
    static func jja_praseArray<T:JsonModelProtocal>(jsonData: JSON) -> [T]? {
        let str = jsonData.rawString()
        return [T].deserialize(from: str) as? [T]
    }
    
    
}
