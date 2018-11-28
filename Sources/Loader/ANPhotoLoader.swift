//
//  ANPhotoLoader.swift
//  ANPhotoBrowser
//
//  Created by 刘栋 on 2018/11/28.
//  Copyright © 2018 anotheren.com. All rights reserved.
//

import UIKit

public protocol ANPhotoLoader {
    /// 是否有指定的缓存图片
    func isImageCached(on imageView: UIImageView, url: URL) -> Bool

    /// 加载图片并设置给 imageView
    /// 加载本地图片时，url 为空，placeholder 为本地图片
    func setImage(on imageView: UIImageView,
                  url: URL?,
                  placeholder: UIImage?,
                  progressBlock: @escaping (_ receivedSize: Int64, _ totalSize: Int64) -> Void,
                  completionHandler: @escaping () -> Void)
}
