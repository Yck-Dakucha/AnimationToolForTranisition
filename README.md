# AnimationToolForTranisition
###转场动画工具

* 目前只完成了部分转场动画，我是鶸

###现在支持的动画有
```
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
```
动画方式：

```
	CKViewAnimationDirectionFromLeft,
    CKViewAnimationDirectionFromRight,
    CKViewAnimationDirectionFromTop,
    CKViewAnimationDirectionFromBottom,
```

###使用方法

```
    CAAnimation *animation = [CKAnimationTool ck_animationWithType:CKViewAnimationTransitionFade direction:CKViewAnimationDirectionFromBottom];
    [CKAnimationTool ck_setAnimationStart:nil Complete:^(BOOL finished) {
        if (finished) {
            [self.guideView.layer removeAllAnimations];
            [self.guideView removeFromSuperview];
        }
    }];
    [self.guideView.layer addAnimation:animation forKey:nil];
    self.guideView.alpha = 0.0;
```
其中  
`[CKAnimationTool ck_animationWithType:CKViewAnimationTransitionFade direction:CKViewAnimationDirectionFromBottom];`  
是创建一个CAAnimation   
`[CKAnimationTool ck_setAnimationStart:^(BOOL finished) {
        <#code#>
    } Complete:^(BOOL finished) {
        <#code#>
    }]
`  
是设置动画的代理方法，动画开始时与动画结束时
