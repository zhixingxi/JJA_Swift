//
//  JJAConfigModel.swift
//  JJA_Swift
//
//  Created by MQL-IT on 2017/6/14.
//  Copyright © 2017年 MQL-IT. All rights reserved.
//

import Foundation
import HandyJSON

struct JJAConfigModel: HandyJSON {
    var android_last_version: String?
    var ios_force_update: Int = 0
    var ios_last_version: String?
    var live_stat: Int = 0
    var android_force_update: Int = 0
    var ios_update_info: String?
    var down_url: String?
    var android_update_info: String?
}
