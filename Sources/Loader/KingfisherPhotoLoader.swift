//
//  KingfisherPhotoLoader.swift
//  ANPhotoBrowser
//
//  Created by 刘栋 on 2018/11/28.
//  Copyright © 2018 anotheren.com. All rights reserved.
//

import UIKit
import Kingfisher

public class KingfisherPhotoLoader: ANPhotoLoader {
   
    public init() { }

    public func isImageCached(on imageView: UIImageView, url: URL) -> Bool {
        let result = KingfisherManager.shared.cache.imageCachedType(forKey: url.cacheKey)
        switch result {
        case .none:
            return false
        case .memory:
            return true
        case .disk:
            return true
        }
    }

    public func setImage(on imageView: UIImageView, url: URL?, placeholder: UIImage?, progressBlock: @escaping (Int64, Int64) -> Void, completionHandler: @escaping () -> Void) {
        imageView.kf.setImage(with: url, placeholder: placeholder, options: nil, progressBlock: { (receivedSize, totalSize) in
            progressBlock(receivedSize, totalSize)
        }) { (_, _, _, _) in
            completionHandler()
        }
    }
}
