//
//  AnimationViewMenu.h
//  SpringAnimationTest
//
//  Created by 训网高 on 2018/3/5.
//  Copyright © 2018年 训网高. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnimationViewMenu : UIView

@property (nonatomic, assign, getter = isShowing) BOOL show;
@property (nonatomic, strong) UIButton *button1;
@property (nonatomic, strong) UIButton *button2;
@property (nonatomic, assign) NSInteger Tag;
@property (nonatomic, copy) void (^likeButtonClickedOperation)(void);
@property (nonatomic, copy) void (^commentButtonClickedOperation)(void);
@end
