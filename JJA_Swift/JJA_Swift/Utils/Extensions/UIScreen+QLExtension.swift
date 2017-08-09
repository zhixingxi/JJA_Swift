//
//  UIScreen+QLExtension.swift
//  JJA_Swift
//
//  Created by MQL-IT on 2017/8/8.
//  Copyright © 2017年 MQL-IT. All rights reserved.
//  根据屏幕进行尺寸和字体大小的适配

import UIKit

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

private let screen: UIScreen = UIScreen.main

func ql_autoWidth(_ width: Double) -> Double {
    return screen.size_iphoneMini ? screen.width_to_mini(width) : screen.size_iphonePlus ? screen.width_to_plus(width) : width
}
func ql_autoHeight(_ height: Double) -> Double {
    return screen.size_iphoneMini ? screen.height_to_mini(height) : screen.size_iphonePlus ? screen.height_to_plus(height) : height
}

func ql_autoFont(_ fontSize: Double) -> UIFont {
    if screen.size_iphoneMini {
        return UIFont.systemFont(ofSize: CGFloat(fontSize - 1))
    } else if screen.size_iphonePlus {
        return UIFont.systemFont(ofSize: CGFloat(fontSize + 1))
    } else {
        return UIFont.systemFont(ofSize: CGFloat(fontSize))
    }
}

// MARK: - 屏幕尺寸适配相关
extension UIScreen {
    //4,5,4s,5s,SE
    fileprivate var size_iphoneMini: Bool {
       return UIScreen.instancesRespond(to: #selector(getter: currentMode)) ? __CGSizeEqualToSize(CGSize(width: 640, height: 1136), (UIScreen.main.currentMode?.size)!) : false
    }
    // 6,7
    fileprivate var size_iphone: Bool {
        return UIScreen.instancesRespond(to: #selector(getter: currentMode)) ? __CGSizeEqualToSize(CGSize(width: 750, height: 1334), (UIScreen.main.currentMode?.size)!) : false
    }
    //6plus,7plus
    fileprivate var size_iphonePlus: Bool {
        return UIScreen.instancesRespond(to: #selector(getter: currentMode)) ? __CGSizeEqualToSize(CGSize(width: 1242, height: 2208), (UIScreen.main.currentMode?.size)!) : false
    }
    
    
    fileprivate func width_to_mini(_ width: Double) -> Double {
        return width * 320 / 375.0
    }
    fileprivate func width_to_plus(_ width: Double) -> Double {
        return width * 414 / 375.0
    }
    
    fileprivate func height_to_mini(_ height: Double) -> Double {
        return height * 568 / 667.0
    }
    fileprivate func height_to_plus(_ height: Double) -> Double {
        return height * 736 / 667.0
    }
}
