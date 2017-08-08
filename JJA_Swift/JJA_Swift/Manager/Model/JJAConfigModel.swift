//
//  JJAConfigModel.swift
//  JJA_Swift
//
//  Created by MQL-IT on 2017/6/14.
//  Copyright © 2017年 MQL-IT. All rights reserved.
//

import Foundation
import HandyJSON

struct JJAConfigModel: JsonModelProtocal {
    
    
    var android_last_version: String?
    var ios_force_update: Int = 0
    var ios_last_version: String?
    var live_stat: Int = 0
    var android_force_update: Int = 0
    var ios_update_info: String?
    var down_url: String?
    var android_update_info: String?
    
//    //自定义属性转换
//    mutating func mapping(mapper: HelpingMapper) {
//        // specify 'cat_id' field in json map to 'id' property in object
//        mapper <<<
//            self.ios_version <-- "ios_last_version"
//        
//        // specify 'parent' field in json parse as following to 'parent' property in object
//    }
    
}
