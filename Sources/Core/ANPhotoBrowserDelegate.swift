//
//  ANPhotoBrowserDelegate.swfit
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

import Foundation

public protocol ANPhotoBrowserDelegate: class {

    /// 浏览非本地图片时必须实现本方法
    /// 实现本方法以返回图片数量
    func numberOfPhotos(in photoBrowser: ANPhotoBrowser) -> Int

    /// 使用 scale 动画时必须实现本方法
    /// 实现本方法以返回各缩略图所在 view，在转场动画完成后将会修改这个 view 的 alpha 属性
    /// 比如你可返回 ImageView，或整个 Cell
    func photoBrowser(_ photoBrowser: ANPhotoBrowser, thumbnailViewForIndex index: Int) -> UIView?

    /// 实现本方法以返回各缩略图图片
    func photoBrowser(_ photoBrowser: ANPhotoBrowser, thumbnailImageForIndex index: Int) -> UIImage?

    /// 实现本方法以返回高质量图片的 url。可选
    func photoBrowser(_ photoBrowser: ANPhotoBrowser, highQualityUrlForIndex index: Int) -> URL?

    /// 实现本方法以返回原图级质量的 url。当本代理方法有返回值时，自动显示查看原图按钮。可选
    func photoBrowser(_ photoBrowser: ANPhotoBrowser, rawUrlForIndex index: Int) -> URL?
    
    /// 实现本方法以返回本地大图。
    /// 本地图片的展示将优先于网络图片。
    /// 如果给 PhotoBrowser 设置了本地图片组 localImages，则本方法不生效。
    func photoBrowser(_ photoBrowser: ANPhotoBrowser, localImageForIndex index: Int) -> UIImage?

    /// 长按时回调。可选
    func photoBrowser(_ photoBrowser: ANPhotoBrowser, didLongPressForIndex index: Int, image: UIImage, gesture: UILongPressGestureRecognizer)

    /// 即将关闭图片浏览器时回调
    /// - parameter index: 即将关闭时，正在显示的图片序号
    /// - parameter image: 即将关闭时，正在显示的图片
    func photoBrowser(_ photoBrowser: ANPhotoBrowser, willDismissWithIndex index: Int, image: UIImage?)

    /// 已经关闭图片浏览器时回调
    /// - parameter index: 最后显示的图片序号
    /// - parameter image: 最后显示的图片
    func photoBrowser(_ photoBrowser: ANPhotoBrowser, didDismissWithIndex index: Int, image: UIImage?)
}

public extension ANPhotoBrowserDelegate {
    
    func numberOfPhotos(in photoBrowser: ANPhotoBrowser) -> Int { return 0 }

    func photoBrowser(_ photoBrowser: ANPhotoBrowser, thumbnailViewForIndex index: Int) -> UIView? { return nil }

    func photoBrowser(_ photoBrowser: ANPhotoBrowser, highQualityUrlForIndex index: Int) -> URL? { return nil }

    func photoBrowser(_ photoBrowser: ANPhotoBrowser, rawUrlForIndex index: Int) -> URL? { return nil }

    func photoBrowser(_ photoBrowser: ANPhotoBrowser, localImageForIndex index: Int) -> UIImage? { return nil }

    func photoBrowser(_ photoBrowser: ANPhotoBrowser, didLongPressForIndex index: Int, image: UIImage) { }
    
    func photoBrowser(_ photoBrowser: ANPhotoBrowser, didLongPressForIndex index: Int, image: UIImage, gesture: UILongPressGestureRecognizer) { }

    func photoBrowser(_ photoBrowser: ANPhotoBrowser, willDismissWithIndex index: Int, image: UIImage?) { }

    func photoBrowser(_ photoBrowser: ANPhotoBrowser, didDismissWithIndex index: Int, image: UIImage?) { }
}
