//
//  QLGlobalUtils.swift
//  JJA_Swift
//
//  Created by MQL-IT on 2017/6/7.
//  Copyright © 2017年 MQL-IT. All rights reserved.
//

import UIKit

func DebugLog<T>(message: T,
              file: String = #file,
              method: String = #function,
              line: Int = #line,
              time: NSDate = NSDate())
{
    #if DEBUG
        print("[\(time)], \((file as NSString).lastPathComponent)[\(line)], \(method): \(message)")
    #endif
}


/// 屏幕宽度
var myScreenWith: Double {
    return Double(UIScreen.main.bounds.size.width)
}
/// 屏幕高度
var myScreenHeight: Double {
    return Double(UIScreen.main.bounds.size.height)
}
//屏幕缩放比例
var myScreenScale: Double {
    return Double(UIScreen.main.scale)
}


