//
//  ANPhotoBrowserPresentationController.swift
//  ANPhotoBrowser
//
//  Created by 刘栋 on 2018/11/28.
//  Copyright © 2018 anotheren.com. All rights reserved.
//

import Foundation

/// 转场协调器协议
protocol ANPhotoBrowserPresentationController: class {

    /// 蒙板 alpha 值
    var maskAlpha: CGFloat { get set }
}
