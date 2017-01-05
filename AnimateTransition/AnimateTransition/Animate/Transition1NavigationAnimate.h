//
//  Transition1NavigationAnimate.h
//  AnimateTransition
//
//  Created by  lizhongqiang on 2017/1/4.
//  Copyright © 2017年  lizhongqiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,AnimateType) {
    animatePush = 0,
    animatePop
};

@interface Transition1NavigationAnimate : NSObject<UIViewControllerAnimatedTransitioning>

- (instancetype)initWithAnimateType:(AnimateType)type andDuration:(CGFloat)duration;

@property (nonatomic, assign) CGFloat duration;
@property (nonatomic, assign) AnimateType type;

@end
