//
//  CKAnimationTool.h
//  Demo
//
//  Created by 中青致学 on 16/2/24.
//  Copyright © 2016年 ZQZX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, CKViewAnimationTransition) {
    CKViewAnimationTransitionFade,         //淡出
    CKViewAnimationTransitionPush,         //推挤
    CKViewAnimationTransitionReveal,       //揭开
    CKViewAnimationTransitionMoveIn,       //覆盖
    CKViewAnimationTransitionCube,         //立方体
    CKViewAnimationTransitionSuck,         //吸收
    CKViewAnimationTransitionSpin,         //旋转
    CKViewAnimationTransitionRipple,       //波纹
    CKViewAnimationTransitionCurl,         //翻页
    CKViewAnimationTransitionUnCurl,       //反翻页
    CKViewAnimationTransitionCameraOpen,   //镜头开
    CKViewAnimationTransitionCameraClose,  //镜头关
};

typedef NS_ENUM(NSInteger, CKViewAnimationDirection) {
    CKViewAnimationDirectionFromLeft,
    CKViewAnimationDirectionFromRight,
    CKViewAnimationDirectionFromTop,
    CKViewAnimationDirectionFromBottom,
};

typedef void(^ck_animationCompleteBlock)(BOOL finished);

@interface CKAnimationTool : NSObject
/**
 *  动画工具单例
 *
 *  @return
 */
+ (instancetype)ck_animation;
/**
 *  获取转场动画
 *
 *  @param animationType 动画方式
 *  @param direction     动画发生方向
 *
 *  @return 动画
 */
- (CAAnimation *)ck_animationWithType:(CKViewAnimationTransition)animationType direction:(CKViewAnimationDirection)direction;
/**
 *  设置动画代理事件
 *
 *  @param start    动画开始
 *  @param finished 动画结束
 */
- (void)ck_setAnimationStart:(ck_animationCompleteBlock)start Complete:(ck_animationCompleteBlock)finished;

@end
