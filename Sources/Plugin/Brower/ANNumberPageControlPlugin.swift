//
//  ANNumberPageControlPlugin.swift
//  ANPhotoBrowser
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//
//  Created by 刘栋 on 2018/11/28.
//  Copyright © 2018 anotheren.com. All rights reserved.
//

import UIKit

/// 数字型页码指示器
open class ANNumberPageControlPlugin: ANPhotoBrowserPlugin {
    /// 字体
    open var font = UIFont.systemFont(ofSize: 17)

    /// 字颜色
    open var textColor = UIColor.white

    /// 可指定中心点Y坐标
    /// 若不指定，默认为20
    open var centerY: CGFloat?

    /// 数字指示
    open lazy var numberLabel: UILabel = {
        let view = UILabel()
        view.font = font
        view.textColor = textColor
        return view
    }()

    /// 总页码
    open var totalPages = 0

    /// 当前页码
    open var currentPage = 0

    public init() {}

    open func photoBrowser(_ photoBrowser: ANPhotoBrowser, numberOfPhotos count: Int) {
        totalPages = count
        layout()
    }

    open func photoBrowser(_ photoBrowser: ANPhotoBrowser, didChangedPageIndex index: Int) {
        currentPage = index
        layout()
    }

    open func photoBrowser(_ photoBrowser: ANPhotoBrowser, viewDidAppear view: UIView, animated: Bool) {
        // 页面出来后，再显示页码指示器
        // 多于一张图才显示
        if totalPages > 1 {
            view.addSubview(numberLabel)
        }
    }

    open func photoBrowser(_ photoBrowser: ANPhotoBrowser, viewDidLayoutSubviews view: UIView) {
        layout()
        numberLabel.isHidden = totalPages <= 1
    }

    private func layout() {
        numberLabel.text = "\(currentPage + 1) / \(totalPages)"
        numberLabel.sizeToFit()
        guard let superView = numberLabel.superview else { return }
        numberLabel.center = CGPoint(x: superView.bounds.midX,
                                     y: superView.bounds.minY + pageControlOffsetY)
    }

    private var pageControlOffsetY: CGFloat {
        if let centerY = centerY {
            return centerY
        }
        guard let superView = numberLabel.superview else {
            return 0
        }
        var offsetY: CGFloat = 0
        if #available(iOS 11.0, *) {
            offsetY = superView.safeAreaInsets.top
        }
        return 20 + offsetY
    }
}
