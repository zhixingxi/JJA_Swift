//
//  UserRequest.swift
//  JJA_Swift
//
//  Created by MQL-IT on 2017/6/12.
//  Copyright © 2017年 MQL-IT. All rights reserved.
//

import Foundation

struct UserRequest: QLRequest {
    let name: String
    let host = "https://api.onevcat.com"
    var path: String {
        return "/users/\(name)"
    }
    let method: HTTPMethod = .GET
    let parameter: [String: Any] = [:]
    
    typealias Response = User
    
    
}
