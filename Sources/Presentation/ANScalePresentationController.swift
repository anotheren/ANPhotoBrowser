//
//  ANScalePresentationController.swift
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

class ANScalePresentationController: UIPresentationController {

    /// 动画结束后需要隐藏的view
    var currentHiddenView: UIView?

    /// 暂存需隐藏的view的原alpha值
    private var currentHiddenViewOriginAlpha: CGFloat?

    /// 蒙板
    private var maskView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black
        return view
    }()

    /// 更新动画结束后需要隐藏的view
    func updateCurrentHiddenView(_ view: UIView?) {
        // 重新显示前一个隐藏视图。
        // 正常情况currentHiddenViewOriginAlpha必定有值。??后的1.0不会生效。
        currentHiddenView?.alpha = currentHiddenViewOriginAlpha ?? 1.0;
        // 隐藏新视图
        currentHiddenView = view
        currentHiddenViewOriginAlpha = view?.alpha
        view?.alpha = 0.01
    }
    
    override func presentationTransitionWillBegin() {
        super.presentationTransitionWillBegin()
        guard let containerView = self.containerView else { return }

        containerView.addSubview(maskView)
        maskView.frame = containerView.bounds
        maskView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        maskView.alpha = 0
        currentHiddenView?.alpha = 0.01
        presentedViewController.transitionCoordinator?.animate(alongsideTransition: { _ in
            self.maskView.alpha = 1
        }, completion: nil)
    }

    override func dismissalTransitionWillBegin() {
        currentHiddenView?.alpha = 0.01
        presentedViewController.transitionCoordinator?.animate(alongsideTransition: { _ in
            self.maskView.alpha = 0
        }, completion: { _ in
            self.currentHiddenView?.alpha = self.currentHiddenViewOriginAlpha ?? 1.0
        })
    }
}

// MARK: - 转场协调器协议

extension ANScalePresentationController: ANPhotoBrowserPresentationController {
    var maskAlpha: CGFloat {
        set {
            maskView.alpha = newValue
        }
        get {
            return maskView.alpha
        }
    }
}
