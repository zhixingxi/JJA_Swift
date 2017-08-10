//
//  UIColorExtensions.swift
//  JJA_Swift
//
//  Created by MQL-IT on 2017/8/10.
//  Copyright © 2017年 MQL-IT. All rights reserved.
//

import UIKit

// MARK: - 颜色创建
extension UIColor {
    
    convenience init?(hexString: String, transparency: CGFloat = 1) {
        var string = ""
        if hexString.lowercased().hasPrefix("0x") {
            string =  hexString.replacingOccurrences(of: "0x", with: "")
        } else if hexString.hasPrefix("#") {
            string = hexString.replacingOccurrences(of: "#", with: "")
        } else {
            string = hexString
        }
        
        if string.characters.count == 3 { // convert hex to 6 digit format if in short format
            var str = ""
            string.characters.forEach({ str.append(String(repeating: String($0), count: 2)) })
            string = str
        }
        
        guard let hexValue = Int(string, radix: 16) else {
            return nil
        }
        self.init(hex: Int(hexValue), transparency: transparency)
    }
    
    
    convenience init?(red: Int, green: Int, blue: Int, transparency: CGFloat = 1) {
        guard red >= 0 && red <= 255 else {
            return nil
        }
        guard green >= 0 && green <= 255 else {
            return nil
        }
        guard blue >= 0 && blue <= 255 else {
            return nil
        }
        var trans = transparency
        if trans < 0 { trans = 0 }
        if trans > 1 { trans = 1 }
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: trans)
    }
    
    
    private convenience init?(hex: Int, transparency: CGFloat = 1) {
        var trans = transparency
        if trans < 0 { trans = 0 }
        if trans > 1 { trans = 1 }
        
        let red = (hex >> 16) & 0xff
        let green = (hex >> 8) & 0xff
        let blue = hex & 0xff
        self.init(red: red, green: green, blue: blue, transparency: trans)
    }
    
}
