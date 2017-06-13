//
//  MainTabBarController.swift
//  JJA_Swift
//
//  Created by MQL-IT on 2017/6/13.
//  Copyright © 2017年 MQL-IT. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupChildControllers()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}

//MARK: - 界面相关
extension MainTabBarController {
    fileprivate func setupChildControllers() {
        let docDir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let jsonPath = docDir + "/main.json"
        //加载data
        var data = NSData(contentsOfFile: jsonPath)
        //判断data是否有内容,如果没有则从Bundle加载文件
        if data == nil {
            //从Bundle加载data
            let path = Bundle.main.path(forResource: "main.json", ofType: nil)
            data = NSData(contentsOfFile: path!)
        }
        //data一定会有一个内容,反序列化
        
        //3.反序列化转换成数组
        guard let array = try? JSONSerialization.jsonObject(with: data! as Data, options: []) as? [[String: AnyObject]] else { return }
        
        var arrayM = [UIViewController]()
        for dict in array! {
            arrayM.append(controller(dict: dict))
        }
        viewControllers = arrayM
    }
    
    /// 使用字典创建一个子控制器
    ///
    /// - parameter dict: 控制器信息字典[clsName, title, imageName]
    /// - return : 子控制器
    
    private func controller(dict: [String : AnyObject]) -> UIViewController   {
        //1.取得字典内容
        guard let clsName = dict["clsName"] as? String,
            let title = dict["title"] as? String,
            let imageName = dict["imageName"] as? String,
            let cls = NSClassFromString(AppCommonInfo.bundleName + "." + clsName) as? UIViewController.Type else {
                return UIViewController()
        }
        //2.创建视图控制器
        let vc = cls.init()
        vc.title = title
        // 设置控制器的访客视图信息字典
        vc.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.orange], for: .highlighted)
        //设置字体大小,默认大小是12号
        vc.tabBarItem.setTitleTextAttributes([NSFontAttributeName: UIFont.systemFont(ofSize: 12)], for: .normal)
        
        vc.tabBarItem.image = UIImage(named: "tabbar_" + imageName)
        vc.tabBarItem.selectedImage = UIImage(named: "tabbar_" + imageName + "_selected")?.withRenderingMode(.alwaysOriginal)
        
        //实例化导航控制器的时候,会调用push方法,将rootVC压栈
        let nav = NavigationController(rootViewController: vc)
        return nav
    }
}
