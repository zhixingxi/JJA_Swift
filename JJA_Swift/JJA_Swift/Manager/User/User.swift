//
//  User.swift
//  JJA_Swift
//
//  Created by MQL-IT on 2017/6/12.
//  Copyright © 2017年 MQL-IT. All rights reserved.
//

import Foundation

struct User {
    let name: String
    
    let message: String
    
    init?(data: Data) {
        guard let obj = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else { return nil }
        guard let name = obj?["name"] as? String else {return nil}
        guard let message = obj?["message"] as? String else {return nil}
        self.name = name
        self.message = message
    }
}

extension User: QLDecodable {
    static func parse(data: Data) -> User? {
        return User(data: data)
    }
}
