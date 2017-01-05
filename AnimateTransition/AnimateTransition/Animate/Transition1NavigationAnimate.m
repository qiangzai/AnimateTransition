//
//  Transition1NavigationAnimate.m
//  AnimateTransition
//
//  Created by  lizhongqiang on 2017/1/4.
//  Copyright © 2017年  lizhongqiang. All rights reserved.
//

#import "Transition1NavigationAnimate.h"
#import "Define.h"
#import "Demo1ViewController.h"
#import "Demo1DetailViewController.h"

@implementation Transition1NavigationAnimate

- (instancetype)init {
    return [self initWithAnimateType:animatePush andDuration:0.5f];
}

- (instancetype)initWithAnimateType:(AnimateType)type andDuration:(CGFloat)duration {
    if (self = [super init]) {
        _type = type;
        _duration = duration;
    }
    return self;
    
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return _duration;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    if (self.type == animatePush) {
        [self pushAnimateTransition:transitionContext];
    }else {
        [self popAnimateTransition:transitionContext];
    }
}

- (void)pushAnimateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    Demo1ViewController *fromVC = (Demo1ViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    Demo1DetailViewController *toVC = (Demo1DetailViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *containView = [transitionContext containerView];
    CGRect originFrame = [fromVC.targetView convertRect:fromVC.targetView.bounds toView:fromVC.view];
    
    UIView *snapshotView = [fromVC.targetView snapshotViewAfterScreenUpdates:NO];
    snapshotView.frame = originFrame;
    
    CGRect finishFrame = [toVC.targetView convertRect:toVC.targetView.bounds toView:toVC.view];
    
    toVC.view.frame = [transitionContext finalFrameForViewController:toVC];
    
    [containView addSubview:toVC.view];
    [containView addSubview:snapshotView];
    
    
    
    [UIView animateWithDuration:_duration animations:^{
        snapshotView.frame = finishFrame;
        snapshotView.transform = CGAffineTransformMakeScale(0.1f, 0.1f);
    } completion:^(BOOL finished) {
        if (finished) {
            [UIView animateWithDuration:_duration animations:^{
                snapshotView.transform = CGAffineTransformIdentity;
            } completion:^(BOOL finished) {
                if (finished) {
                    [UIView animateWithDuration:_duration animations:^{
                        snapshotView.alpha = 0.0f;
                    } completion:^(BOOL finished) {
                        if (finished) {
                            [snapshotView removeFromSuperview];
                            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
                        }
                    }];
                }
            }];
        }
    }];
    
}

- (void)popAnimateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    Demo1DetailViewController *fromVC = (Demo1DetailViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    Demo1ViewController *toVC = (Demo1ViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containView = [transitionContext containerView];
    CGRect originFrame = [fromVC.targetView convertRect:fromVC.targetView.bounds toView:fromVC.view];
    UIView *snapshotView = [fromVC.targetView snapshotViewAfterScreenUpdates:NO];
    snapshotView.frame = originFrame;
    CGRect finishFrame = [toVC.targetView convertRect:toVC.targetView.bounds toView:toVC.view];
    toVC.view.frame = [transitionContext finalFrameForViewController:toVC];
    [containView addSubview:toVC.view];
    [containView addSubview:fromVC.view];
    [containView addSubview:snapshotView];
    
    [UIView animateWithDuration:_duration animations:^{
        snapshotView.frame = finishFrame;
        snapshotView.transform = CGAffineTransformMakeScale(1.1f, 1.1f);
        
    } completion:^(BOOL finished) {
        if (finished) {
            [fromVC.view removeFromSuperview];
            [UIView animateWithDuration:_duration animations:^{
                
                snapshotView.transform = CGAffineTransformIdentity;
            } completion:^(BOOL finished) {
                
                [snapshotView removeFromSuperview];
                [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
            }];
        }
    }];
    
}

@end
