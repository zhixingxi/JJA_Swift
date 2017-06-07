//
//  AppCommonInfo.swift
//  JJA_Swift
//
//  Created by MQL-IT on 2017/6/7.
//  Copyright © 2017年 MQL-IT. All rights reserved.
//  应用程序的通用信息

import Foundation

public struct AppCommonInfo {
    /// app名称
    public static var appName: String {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as! String
    }
    
    /// App版本号
    public static var appVersion: String {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
    }
    
    /// app构建版本号
    public static var appBuildVersion: String {
        return Bundle.main.object(forInfoDictionaryKey: kCFBundleVersionKey as String) as! String
    }
    
    /// bundleID
    public static var bundleIdentifier: String {
        return Bundle.main.infoDictionary!["CFBundleIdentifier"] as! String
    }
    
    /// bundleName
    public static var bundleName: String {
        return Bundle.main.infoDictionary!["CFBundleName"] as! String
    }

    /// appleStore下载地址
    public static var appStoreURL: URL {
        return URL(string: "")!
    }
    
    public static var appVersionAndBuild: String {
        let version = appVersion, build = appBuildVersion
        return version == appBuildVersion ? "v\(version)" : "v\(version)(\(build))"
    }
}
