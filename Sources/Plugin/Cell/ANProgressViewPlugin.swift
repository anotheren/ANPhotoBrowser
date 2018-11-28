//
//  ANProgressViewPlugin.swift
//  ANPhotoBrowser
//
//  Created by 刘栋 on 2018/11/28.
//  Copyright © 2018 anotheren.com. All rights reserved.
//

import UIKit

/// 图片加载进度插件
open class ANProgressViewPlugin: ANPhotoBrowserCellPlugin {
    
    public init() { }

    /// 每次取复用 cell 时会调用
    public func photoBrowserCellDidReused(_ cell: ANPhotoBrowserCell, at index: Int) {
        if progressView(for: cell) == nil {
            let view = ANProgressView()
            view.isHidden = true
            cell.contentView.addSubview(view)
            cell.associatedObjects["ProgressView"] = view
        }
    }

    /// PhotoBrowserCell 执行布局方法时调用
    public func photoBrowserCellDidLayout(_ cell: ANPhotoBrowserCell) {
        progressView(for: cell)?.center = CGPoint(x: cell.contentView.bounds.midX, y: cell.contentView.bounds.midY)
    }

    /// 即将加载图片
    public func photoBrowserCellWillLoadImage(_ cell: ANPhotoBrowserCell, placeholder: UIImage?, url: URL?) {
        progressView(for: cell)?.isHidden = false
    }

    /// 正在加载图片
    public func photoBrowserCellLoadingImage(_ cell: ANPhotoBrowserCell, receivedSize: Int64, totalSize: Int64) {
        if totalSize > 0 {
            progressView(for: cell)?.progress = CGFloat(receivedSize) / CGFloat(totalSize)
        }
    }

    /// 加载图片完成
    public func photoBrowserCellDidLoadImage(_ cell: ANPhotoBrowserCell, placeholder: UIImage?, url: URL?) {
        progressView(for: cell)?.isHidden = true
    }

    private func progressView(for cell: ANPhotoBrowserCell) -> ANProgressView? {
        return cell.associatedObjects["ProgressView"] as? ANProgressView
    }
}
