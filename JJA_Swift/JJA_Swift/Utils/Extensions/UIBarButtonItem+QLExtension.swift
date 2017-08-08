//
//  UIBarButtonItem+QLExtension.swift
//  JJA_Swift
//
//  Created by MQL-IT on 2017/8/8.
//  Copyright © 2017年 MQL-IT. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    convenience init(target: Any?, action: Selector, isBackButton: Bool = false) {
        
        let btn: UIButton = UIButton(type: .custom)
        btn.addTarget(target, action: action, for: .touchUpInside)
        
        if isBackButton {
            let imageName = "back"
            btn.setImage(UIImage.init(named: imageName), for: .normal)
            btn.sizeToFit()
        }
        //实例化UIBarButtonItem
        self.init(customView: btn)
    }
}
