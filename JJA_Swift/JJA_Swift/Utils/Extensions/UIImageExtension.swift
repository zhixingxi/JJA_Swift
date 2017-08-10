//
//  UIImageExtension.swift
//  JJA_Swift
//
//  Created by MQL-IT on 2017/8/10.
//  Copyright © 2017年 MQL-IT. All rights reserved.
//

#if os(iOS) || os(tvOS) || os(watchOS)
import UIKit

extension UIImage {
    
    /// 根据颜色绘制图片
    ///
    /// - Parameters:
    ///   - color: 颜色
    ///   - size: 尺寸
    convenience init(color: UIColor, size: CGSize) {
        UIGraphicsBeginImageContextWithOptions(size, false, 1)
        color.setFill()
        UIRectFill(CGRect(x: 0, y: 0, width: size.width, height: size.height))
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else {
            self.init()
            return
        }
        UIGraphicsEndImageContext()
        guard let aCgImage = image.cgImage else {
            self.init()
            return
        }
        self.init(cgImage: aCgImage)
    }
    /// 压缩图片
    ///
    /// - Parameter quality: 压缩比
    /// - Returns: 返回新的图片
    func compressed(quality: CGFloat = 0.5) -> UIImage? {
        guard let data = UIImageJPEGRepresentation(self, quality) else {
            return nil
        }
        return UIImage(data: data)
    }
    
    
}
    
#endif
