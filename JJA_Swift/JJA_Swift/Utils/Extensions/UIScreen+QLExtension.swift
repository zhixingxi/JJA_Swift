//
//  UIScreen+QLExtension.swift
//  JJA_Swift
//
//  Created by MQL-IT on 2017/8/8.
//  Copyright © 2017年 MQL-IT. All rights reserved.
//

import UIKit

extension UIScreen {
    var screenWith: CGFloat {
        return UIScreen.main.bounds.size.width
    }
    
    var screenHeight: CGFloat {
        return UIScreen.main.bounds.size.height
    }
    
    var screenScale: CGFloat {
        return UIScreen.main.scale
    }
}
