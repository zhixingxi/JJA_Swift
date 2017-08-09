//
//  JJANewFeatureView.swift
//  JJA_Swift
//
//  Created by MQL-IT on 2017/8/8.
//  Copyright © 2017年 MQL-IT. All rights reserved.
//  引导图界面

import UIKit
private let SCREEN_WIDTH: Double = Double(UIScreen.main.bounds.size.width)
private let SCREEN_HEIGHT: Double = Double(UIScreen.main.bounds.size.height)


class JJANewFeatureView: UIView {
    
    fileprivate lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT))
        scrollView.backgroundColor = UIColor.clear
        scrollView.bounces = false
        scrollView.isPagingEnabled = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.delegate = self
        return scrollView
    }()
    
    fileprivate lazy var enterBtn: UIButton = {
        let btn = UIButton(type: UIButtonType.custom)
        btn.backgroundColor = UIColor.clear
        btn.frame = CGRect(x: 0, y: SCREEN_HEIGHT - 70, width: SCREEN_WIDTH, height: 70)
        btn.addTarget(self, action: #selector(enterHome), for: .touchUpInside)
        btn.isHidden = true
        return btn
    }()
    
    
    fileprivate let imageArray = ["new_feature_1", "new_feature_2", "new_feature_3", "new_feature_4"]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame = UIScreen.main.bounds
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func enterHome(btn: UIButton) {
        removeFromSuperview()
    }
}

//MARK: - 界面
extension JJANewFeatureView {
    func setupUI() {
        addSubview(scrollView)
        addSubview(enterBtn)
        let count = imageArray.count
        let rect = UIScreen.main.bounds
        for i in 0 ..< count {
            let iv = UIImageView(image: UIImage(named: imageArray[i]))
            //设置大小
            iv.frame = rect.offsetBy(dx: CGFloat(i) * rect.width, dy: 0)
            iv.isUserInteractionEnabled = true
            scrollView.addSubview(iv)
        }
        scrollView.contentSize = CGSize(width: Double(count + 1) * SCREEN_WIDTH, height: SCREEN_HEIGHT)
    }
}

// MARK: - 代理
extension JJANewFeatureView: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        // 1.滚动到最后一屏, 视图删除
        let page = Int(scrollView.contentOffset.x / scrollView.bounds.width)
        // 2. 判断是否是最后一页
        if page == scrollView.subviews.count {
            removeFromSuperview()
        }
        if page == scrollView.subviews.count - 1 {
            enterBtn.isHidden = false
        }
    }
}


