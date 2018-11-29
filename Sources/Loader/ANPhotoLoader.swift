//
//  ANPhotoLoader.swift
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
