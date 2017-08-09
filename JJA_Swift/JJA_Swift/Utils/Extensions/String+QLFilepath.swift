//
//  String+QLFilepath.swift
//  JJA_Swift
//
//  Created by MQL-IT on 2017/8/9.
//  Copyright © 2017年 MQL-IT. All rights reserved.
//

import Foundation

extension String {
    
    public var lastPathComponent: String {
        return (self as NSString).lastPathComponent
    }
    
    func ql_appendDocumentDir() -> String? {
        
        let dir: NSString = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last! as NSString;
        
        return dir.appendingPathComponent(self)
    }
}
