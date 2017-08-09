//
//  UIDeviceExtension.swift
//  JJA_Swift
//
//  Created by MQL-IT on 2017/8/9.
//  Copyright © 2017年 MQL-IT. All rights reserved.
//

import UIKit

fileprivate enum QLDeviceModel : String{
    case simulator = "Simulator/Sandbox",
    iphoneMini     = "iphoneMini",
    iphone         = "iphone",
    iphonePlus     = "iphonePlus"
}

 private extension UIDevice {
    
    class var deviceModel: QLDeviceModel {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8,  value != 0  else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        
        switch identifier {
            case "iPhone3,1", "iPhone3,2", "iPhone3,3", "iPhone4,1", "iPhone5,1", "iPhone5,2", "iPhone5,3", "iPhone5,4", "iPhone6,1", "iPhone6,2", "iPhone8,4": return .iphoneMini
            case "iPhone7,2", "iPhone8,1", "iPhone9,1": return .iphone
                
            case"iPhone7,1", "iPhone8,2", "iPhone9,2": return .iphonePlus
            case "i386", "x86_64":                          return .simulator
            default:                    return .iphone
        }
    }
    
    
    
}
