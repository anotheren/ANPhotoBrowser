//
//  ANAnimationType.swift
//  ANPhotoBrowser
//
//  Created by 刘栋 on 2018/11/28.
//  Copyright © 2018 anotheren.com. All rights reserved.
//

import Foundation

/// 转场动画类型
public enum ANAnimationType {
    /// 缩放
    case scale
    /// 缩放，不隐藏关联缩略图
    case scaleNoHiding
    /// 透明渐变
    case fade
}
