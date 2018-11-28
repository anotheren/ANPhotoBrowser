//
//  ANPhotoBrowserPlugin.swift
//  ANPhotoBrowser
//
//  Created by 刘栋 on 2018/11/28.
//  Copyright © 2018 anotheren.com. All rights reserved.
//

import UIKit

public protocol ANPhotoBrowserPlugin {
    
    /// Previewing的Peek操作
    var previewActionItems: [UIPreviewActionItem] {get}
    
    /// 页码已改变
    func photoBrowser(_ photoBrowser: ANPhotoBrowser, didChangedPageIndex index: Int)

    /// 滑动时调用
    func photoBrowser(_ photoBrowser: ANPhotoBrowser, scrollViewDidScroll: UIScrollView)

    /// 每次取图片总数量时会调用
    func photoBrowser(_ photoBrowser: ANPhotoBrowser, numberOfPhotos number: Int)

    /// 执行 viewDidLoad 时调用
    func photoBrowser(_ photoBrowser: ANPhotoBrowser, viewDidLoad view: UIView)

    /// 执行 viewWillAppear 时调用
    func photoBrowser(_ photoBrowser: ANPhotoBrowser, viewWillAppear view: UIView, animated: Bool)

    /// 执行 viewDidAppear 时调用
    func photoBrowser(_ photoBrowser: ANPhotoBrowser, viewDidAppear view: UIView, animated: Bool)

    /// 执行 viewWillLayoutSubviews 时调用
    func photoBrowser(_ photoBrowser: ANPhotoBrowser, viewWillLayoutSubviews view: UIView)

    /// 执行 viewDidLayoutSubviews 时调用
    func photoBrowser(_ photoBrowser: ANPhotoBrowser, viewDidLayoutSubviews view: UIView)

    /// 执行 viewWillDisappear 时调用
    func photoBrowser(_ photoBrowser: ANPhotoBrowser, viewWillDisappear view: UIView)

    /// 执行 viewDidDisappear 时调用
    func photoBrowser(_ photoBrowser: ANPhotoBrowser, viewDidDisappear view: UIView)
}

extension ANPhotoBrowserPlugin {
    
    /// Previewing的Peek操作
    public var previewActionItems: [UIPreviewActionItem] { return [] }
    
    /// 页码已改变
    public func photoBrowser(_ photoBrowser: ANPhotoBrowser, didChangedPageIndex index: Int) { }

    /// 滑动时调用
    public func photoBrowser(_ photoBrowser: ANPhotoBrowser, scrollViewDidScroll: UIScrollView) { }

    /// 每次取图片总数量时会调用
    public func photoBrowser(_ photoBrowser: ANPhotoBrowser, numberOfPhotos number: Int) { }

    /// 每次取复用 cell 时会调用
    public func photoBrowser(_ photoBrowser: ANPhotoBrowser, reusableCell cell: ANPhotoBrowserCell, atIndex index: Int) { }

    /// PhotoBrowserCell 执行布局方法时调用
    public func photoBrowser(_ photoBrowser: ANPhotoBrowser, didLayout cell: ANPhotoBrowserCell) { }

    /// 执行 viewDidLoad 时调用
    public func photoBrowser(_ photoBrowser: ANPhotoBrowser, viewDidLoad view: UIView) { }

    /// 执行 viewWillAppear 时调用
    public func photoBrowser(_ photoBrowser: ANPhotoBrowser, viewWillAppear view: UIView, animated: Bool) { }

    /// 执行 viewDidAppear 时调用
    public func photoBrowser(_ photoBrowser: ANPhotoBrowser, viewDidAppear view: UIView, animated: Bool) { }

    /// 执行 viewWillLayoutSubviews 时调用
    public func photoBrowser(_ photoBrowser: ANPhotoBrowser, viewWillLayoutSubviews view: UIView) { }

    /// 执行 viewDidLayoutSubviews 时调用
    public func photoBrowser(_ photoBrowser: ANPhotoBrowser, viewDidLayoutSubviews view: UIView) { }

    /// 执行 viewWillDisappear 时调用
    public func photoBrowser(_ photoBrowser: ANPhotoBrowser, viewWillDisappear view: UIView) { }

    /// 执行 viewDidDisappear 时调用
    public func photoBrowser(_ photoBrowser: ANPhotoBrowser, viewDidDisappear view: UIView) { }
}
