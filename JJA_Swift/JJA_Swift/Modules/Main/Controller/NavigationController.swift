//
//  NavigationController.swift
//  JJA_Swift
//
//  Created by MQL-IT on 2017/6/13.
//  Copyright © 2017年 MQL-IT. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.setBackgroundImage(UIImage(), for: .default)
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if childViewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
            if let vc = viewController as? BaseViewController {
                vc.navigationItem.leftBarButtonItem = UIBarButtonItem(target: self, action: #selector(popToPre), isBackButton: true)
            }
        }
        super.pushViewController(viewController, animated: animated)
    }
    
    @objc func popToPre() {
        popViewController(animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}
