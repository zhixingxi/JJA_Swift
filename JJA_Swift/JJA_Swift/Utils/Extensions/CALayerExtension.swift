//
//  CALayerExtension.swift
//  JJA_Swift
//
//  Created by MQL-IT on 2017/8/9.
//  Copyright © 2017年 MQL-IT. All rights reserved.
//

import UIKit


extension CALayer {
    var x: CGFloat {
        get {
            return frame.origin.x
        }
        set {
            frame.origin.x = newValue
        }
    }
    
    var y: CGFloat {
        get {
            return frame.origin.y
        }
        set {
            frame.origin.y = newValue
        }
    }
    
    var width: CGFloat {
        get {
            return frame.size.width
        }
        set {
            frame.size.width = newValue
        }
    }
    
    var height: CGFloat {
        get {
            return frame.size.height
        }
        set {
            frame.size.height = newValue
        }
    }
    
    
    var centerX: CGFloat {
        get {
            return position.x
        }
        set {
            position.x = newValue
        }
    }
    
    var centerY: CGFloat {
        get {
            return position.y
        }
        set {
            position.y = newValue
        }
    }
}
