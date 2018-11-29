//
//  ANPhotoBrowserCellPlugin.swift
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

public protocol ANPhotoBrowserCellPlugin {

    /// 每次取复用 cell 时会调用
    func photoBrowserCellDidReused(_ cell: ANPhotoBrowserCell, at index: Int)

    /// PhotoBrowserCell 执行布局方法时调用
    func photoBrowserCellDidLayout(_ cell: ANPhotoBrowserCell)

    /// 设置图片资源时回调
    func photoBrowserCellSetImage(_ cell: ANPhotoBrowserCell, placeholder: UIImage?, highQualityUrl: URL?, rawUrl: URL?)

    /// 即将加载图片
    func photoBrowserCellWillLoadImage(_ cell: ANPhotoBrowserCell, placeholder: UIImage?, url: URL?)

    /// 正在加载图片
    func photoBrowserCellLoadingImage(_ cell: ANPhotoBrowserCell, receivedSize: Int64, totalSize: Int64)

    /// 加载图片完成
    func photoBrowserCellDidLoadImage(_ cell: ANPhotoBrowserCell, placeholder: UIImage?, url: URL?)
    
    /// cell willDisplay 时会调用
    func photoBrowserCellWillDisplay(_ cell: ANPhotoBrowserCell, at index: Int)
    
    /// cell didEndDisplaying 时会调用
    func photoBrowserCellDidEndDisplaying(_ cell: ANPhotoBrowserCell, at index: Int)
}

extension ANPhotoBrowserCellPlugin {
    /// 每次取复用 cell 时会调用
    public func photoBrowserCellDidReused(_ cell: ANPhotoBrowserCell, at index: Int) { }

    /// PhotoBrowserCell 执行布局方法时调用
    public func photoBrowserCellDidLayout(_ cell: ANPhotoBrowserCell) { }

    /// 设置图片资源时回调
    public func photoBrowserCellSetImage(_ cell: ANPhotoBrowserCell, placeholder: UIImage?, highQualityUrl: URL?, rawUrl: URL?) { }

    /// 即将加载图片
    public func photoBrowserCellWillLoadImage(_ cell: ANPhotoBrowserCell, placeholder: UIImage?, url: URL?) { }

    /// 正在加载图片
    public func photoBrowserCellLoadingImage(_ cell: ANPhotoBrowserCell, receivedSize: Int64, totalSize: Int64) { }

    /// 加载图片完成
    public func photoBrowserCellDidLoadImage(_ cell: ANPhotoBrowserCell, placeholder: UIImage?, url: URL?) { }
    
    /// cell willDisplay 时会调用
    public func photoBrowserCellWillDisplay(_ cell: ANPhotoBrowserCell, at index: Int) { }
    
    /// cell didEndDisplaying 时会调用
    public func photoBrowserCellDidEndDisplaying(_ cell: ANPhotoBrowserCell, at index: Int) { }
}
