//
//  JJAConfigModel.swift
//  JJA_Swift
//
//  Created by MQL-IT on 2017/6/14.
//  Copyright © 2017年 MQL-IT. All rights reserved.
//

import Foundation
import SwiftyJSON

private let jjaConfigFile: String = "configModel.json"

struct JJAConfigModel: JsonModelProtocal {
    
    
    var android_last_version: String?
    var ios_force_update: Int = 0
    var ios_last_version: String?
    var live_stat: Int = 0
    var android_force_update: Int = 0
    var ios_update_info: String?
    var down_url: String?
    var android_update_info: String?
    
    static func creatConfigModel() -> JJAConfigModel? {
        var model = JJAConfigModel()
        guard let path = jjaConfigFile.ql_appendDocumentDir(),
            let data = NSData(contentsOfFile: path) else {
                return model
        }
        let jsonDict = JSON(data: data as Data)
        
        model.ios_force_update = jsonDict["ios_force_update"].intValue
        model.live_stat = jsonDict["live_stat"].intValue
        model.ios_last_version = jsonDict["ios_last_version"].stringValue
        model.ios_update_info = jsonDict["ios_update_info"].stringValue
        model.down_url = jsonDict["down_url"].stringValue
        return model
    }
    
    
    func saveConfigModel() {
        let dict = self.toJSON() as [String: AnyObject]? ?? [:]
        guard let data = try? JSONSerialization.data(withJSONObject: dict, options: []),
            let fileName = jjaConfigFile.ql_appendDocumentDir() else {
                return
            }
        // 写入磁盘
        (data as NSData).write(toFile: fileName, atomically: true)
        
    }
    
//    //自定义属性转换
//    mutating func mapping(mapper: HelpingMapper) {
//        // specify 'cat_id' field in json map to 'id' property in object
//        mapper <<<
//            self.ios_version <-- "ios_last_version"
//        
//        // specify 'parent' field in json parse as following to 'parent' property in object
//    }
    
}
