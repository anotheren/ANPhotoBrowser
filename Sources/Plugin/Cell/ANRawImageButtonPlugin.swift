//
//  ANRawImageButtonPlugin.swift
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

/// 查看原图插件
open class ANRawImageButtonPlugin: ANPhotoBrowserCellPlugin {
    
    public var buttonTitle = "查看原图"
    
    public var buttonTitleColor = UIColor.white
    
    public var buttonBackground = UIColor.black.withAlphaComponent(0.08)

    public init() {}
    
    public func photoBrowserCellDidReused(_ cell: ANPhotoBrowserCell, at index: Int) {
        if rawImageButton(for: cell) == nil {
            cell.associatedObjects["RawImageButton"] = makeRawImageButton()
        }
    }

    public func photoBrowserCellSetImage(_ cell: ANPhotoBrowserCell, placeholder: UIImage?, highQualityUrl: URL?, rawUrl: URL?) {
        // 隐藏按钮
        rawImageButton(for: cell)?.isHidden = true
    }

    public func photoBrowserCellDidLayout(_ cell: ANPhotoBrowserCell) {
        if let button = rawImageButton(for: cell), !button.isHidden {
            cell.contentView.addSubview(button)
            button.sizeToFit()
            button.bounds.size.width += 14
            button.center = CGPoint(x: cell.contentView.bounds.midX,
                                    y: cell.contentView.bounds.height - 25 - button.bounds.height)
        }
    }

    public func photoBrowserCellDidLoadImage(_ cell: ANPhotoBrowserCell, placeholder: UIImage?, url: URL?) {
        if let rawUrl = cell.rawUrl {
            if let url = url, url != rawUrl {
                // 显示按钮
                rawImageButton(for: cell)?.isHidden = false
            }
        }
    }

    private func rawImageButton(for cell: ANPhotoBrowserCell) -> UIButton? {
        return cell.associatedObjects["RawImageButton"] as? UIButton
    }

    private func makeRawImageButton() -> UIButton {
        let button = UIButton(type: .custom)
        button.setTitleColor(buttonTitleColor, for: .normal)
        button.setTitleColor(buttonTitleColor, for: .highlighted)
        button.backgroundColor = buttonBackground
        button.setTitle(buttonTitle, for: .normal)
        button.setTitle(buttonTitle, for: .highlighted)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.layer.borderColor = buttonTitleColor.cgColor
        button.layer.borderWidth = 1 / UIScreen.main.scale
        button.layer.cornerRadius = 4
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(onRawImageButton), for: .touchUpInside)
        return button
    }

    /// 响应查看原图按钮
    @objc open func onRawImageButton(_ button: UIButton) {
        var photoBrowserCell: ANPhotoBrowserCell? = nil
        var view: UIView? = button
        while let sView = view?.superview {
            if let cell = sView as? ANPhotoBrowserCell {
                photoBrowserCell = cell
                break
            }
            view = sView
        }
        button.isHidden = true
        photoBrowserCell?.loadRawImage()
    }
}
