//
//  ANFadeAnimator.swift
//  ANPhotoBrowser
//
//  Created by 刘栋 on 2018/11/28.
//  Copyright © 2018 anotheren.com. All rights reserved.
//

import UIKit

/// 透明渐变动画
class ANFadeAnimator: NSObject, UIViewControllerAnimatedTransitioning {

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.25
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        // 转场容器
        let containerView = transitionContext.containerView

        // 判断是 presentataion 动画还是 dismissal 动画
        guard let fromVC = transitionContext.viewController(forKey: .from),
            let toVC = transitionContext.viewController(forKey: .to) else {
                print("获取 viewController 失败")
                transitionContext.completeTransition(false)
                return
        }
        let presentation = (toVC.presentingViewController == fromVC)

        // 取所要打开的控制器视图
        guard let openingView = transitionContext.view(forKey: presentation ? .to : .from) else {
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            print("获取 所要打开的控制器视图 失败")
            transitionContext.completeTransition(false)
            return
        }
        // presentation转场，需要把目标视图添加到视图栈
        if presentation {
            containerView.addSubview(openingView)
        }
        // 视图透明渐变
        let beginAlpha = presentation ? 0 : openingView.alpha
        let endAlpha = presentation ? openingView.alpha : 0
        openingView.alpha = beginAlpha
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            openingView.alpha = endAlpha
        }) { _ in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
}
