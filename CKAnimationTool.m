//
//  CKAnimationTool.m
//  Demo
//
//  Created by 中青致学 on 16/2/24.
//  Copyright © 2016年 ZQZX. All rights reserved.
//

#import "CKAnimationTool.h"

#define kAnimationDuration 0.5
@interface CKAnimationTool()

@property (nonatomic, copy) ck_animationCompleteBlock animationFinishedBlock;
@property (nonatomic, copy) ck_animationCompleteBlock animationStartBlock;

@end

@implementation CKAnimationTool

+ (instancetype)ck_animation {
    static CKAnimationTool *animation;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        animation = [[CKAnimationTool alloc] init];
    });
    return animation;
}

- (CAAnimation *)ck_animationWithType:(CKViewAnimationTransition)animationType direction:(CKViewAnimationDirection)direction {
    CATransition *animation = [CATransition animation];
    [animation setDuration: kAnimationDuration];
    switch (animationType) {
        case CKViewAnimationTransitionFade:
            animation.type = kCATransitionFade;
            break;
        case CKViewAnimationTransitionPush:
            animation.type = kCATransitionPush;
            break;
        case CKViewAnimationTransitionReveal:
            animation.type = kCATransitionReveal;
            break;
        case CKViewAnimationTransitionMoveIn:
            animation.type = kCATransitionMoveIn;
            break;
        case CKViewAnimationTransitionCube:
            animation.type = @"cube";
            break;
        case CKViewAnimationTransitionSuck:
            animation.type = @"suckEffect";
            break;
        case CKViewAnimationTransitionSpin:
            animation.type = @"oglFlip";
            break;
        case CKViewAnimationTransitionRipple:
            animation.type = @"rippleEffect";
            break;
        case CKViewAnimationTransitionCurl:
            animation.type = @"pageCurl";
            break;
        case CKViewAnimationTransitionUnCurl:
            animation.type = @"pageUnCurl";
            break;
        case CKViewAnimationTransitionCameraOpen:
            animation.type = @"cameraIrisHollowOpen";
            break;
        case CKViewAnimationTransitionCameraClose:
            animation.type = @"cameraIrisHollowClose";
            break;
            
        default:
            animation.type = kCATransitionPush;
            break;
    }
    
    switch (direction) {
        case CKViewAnimationDirectionFromTop:
            animation.subtype = kCATransitionFromTop;
            break;
        case CKViewAnimationDirectionFromLeft:
            animation.subtype = kCATransitionFromLeft;
            break;
        case CKViewAnimationDirectionFromRight:
            animation.subtype = kCATransitionFromRight;
            break;
        case CKViewAnimationDirectionFromBottom:
            animation.subtype = kCATransitionFromBottom;
            break;
            
        default:
            animation.subtype = kCATransitionFromLeft;
            break;
    }
    
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault]];
    animation.delegate = self;
    return animation;
}

- (void)ck_setAnimationStart:(ck_animationCompleteBlock)start Complete:(ck_animationCompleteBlock)finished {
    if (start) {
        self.animationStartBlock = start;
    }
    if (finished) {
        self.animationFinishedBlock = finished;
    }
}

#pragma mark -  AnimationDelegate
- (void)animationDidStart:(CAAnimation *)anim {
    if (self.animationStartBlock) {
        self.animationStartBlock(YES);
    }
}
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    if (flag) {
        if (self.animationFinishedBlock) {
            self.animationFinishedBlock(flag);
        }
    }
}

@end
