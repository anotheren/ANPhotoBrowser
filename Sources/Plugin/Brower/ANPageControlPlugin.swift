//
//  ANPageControlPlugin.swift
//  ANPhotoBrowser
//
//  Created by 刘栋 on 2018/11/28.
//  Copyright © 2018 anotheren.com. All rights reserved.
//

import UIKit

/// 光点型页码指示器
open class ANPageControlPlugin: ANPhotoBrowserPlugin {

    /// 可指定中心点Y坐标，距离底部值。默认值：iPhoneX为30，非iPhoneX为20
    open lazy var centerBottomY: CGFloat = {
        if #available(iOS 11.0, *) {
            return 30
        }
        return 20
    }()

    /// 页码指示器
    open lazy var pageControl: UIPageControl = {
        let pgc = UIPageControl()
        pgc.isEnabled = false
        return pgc
    }()

    /// 总页码
    open var totalPages = 0

    /// 当前页码
    open var currentPage = 0

    public init() {}

    open func photoBrowser(_ photoBrowser: ANPhotoBrowser, didChangedPageIndex index: Int) {
        currentPage = index
        layout()
    }

    open func photoBrowser(_ photoBrowser: ANPhotoBrowser, numberOfPhotos count: Int) {
        totalPages = count
        layout()
    }

    open func photoBrowser(_ photoBrowser: ANPhotoBrowser, viewDidAppear view: UIView, animated: Bool) {
        // 页面出来后，再显示页码指示器
        // 多于一张图才显示
        if totalPages > 1 {
            view.addSubview(pageControl)
        }
    }

    open func photoBrowser(_ photoBrowser: ANPhotoBrowser, viewDidLayoutSubviews view: UIView) {
        layout()
        pageControl.isHidden = totalPages <= 1
    }

    private func layout() {
        pageControl.numberOfPages = totalPages
        pageControl.currentPage = currentPage
        pageControl.sizeToFit()
        guard let superView = pageControl.superview else { return }
        pageControl.center = CGPoint(x: superView.bounds.midX,
                                     y: superView.bounds.maxY - centerBottomY)
    }
}
