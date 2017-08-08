//
//  AppDelegate+QLCommon.swift
//  JJA_Swift
//
//  Created by MQL-IT on 2017/6/7.
//  Copyright © 2017年 MQL-IT. All rights reserved.
//  AppDelegate的扩展, 主要进行App的一些通用配置信息

import UIKit
import UserNotifications

extension AppDelegate {
    
    /// 一些全局配置信息
    func setupAdditions() {
        // 设置用户授权显示通知
        if #available(iOS 10.0, *) {
            UNUserNotificationCenter.current().requestAuthorization(options: [.badge, .sound, .alert, .carPlay], completionHandler: { (isSuccess, error) in
                
            })
        } else {
            // 取得用户授权显示通知(上方的提示条/声音/badgeNumber )
            let notificationSetting = UIUserNotificationSettings(types: [.badge, .alert, .sound], categories: nil)
            UIApplication.shared.registerUserNotificationSettings(notificationSetting)
        }
    }
    
    //加载app配置信息
    func loadAppConfigerInformation() {
        QLHTTPTools.shareInstance.jja_request(target: .ConfigInfo, successHandle: { (responsObj) in
            QLHTTPTools.shareInstance.configModel = JJAConfigModel.jja_prase(jsonData: responsObj)
        }) { (error) in
            
        }
        
    }
    
    /// 从服务器加载一些应用程序信息
    func loadAppInformation() {
        
    }
    
}
