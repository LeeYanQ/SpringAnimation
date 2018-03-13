//
//  AnimationViewMenu.m
//  SpringAnimationTest
//
//  Created by 训网高 on 2018/3/5.
//  Copyright © 2018年 训网高. All rights reserved.
//

#import "AnimationViewMenu.h"

//#define width self.frame.size.width
//#define height self.frame.size.height
@implementation AnimationViewMenu

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self creatSubViewsWithFrame:frame];
    }
    return self;
}

- (void)creatSubViewsWithFrame:(CGRect)frame {
    NSLog(@"%f,%f",frame.size.width,frame.size.height);
    _button1 = [self creatButtonWithTitle:@"赞" image:[UIImage imageNamed:@"AlbumLike"] selImage:[UIImage imageNamed:@""] target:self selector:@selector(giveLikeButtonClick)];
    _button1.frame = CGRectMake(10, 5, (frame.size.width-40)/2, frame.size.height - 10);
    
    [self addSubview:_button1];
    _button2 = [self creatButtonWithTitle:@"评论" image:[UIImage imageNamed:@"AlbumComment"] selImage:[UIImage imageNamed:@""] target:self selector:@selector(commentButtonClick)];
    _button2.frame = CGRectMake(0, 5, (frame.size.width-40)/2, frame.size.height - 10);
    
    [self addSubview:_button2];
    
}

- (void)setShow:(BOOL)show {
    _show = show;
    UIButton *button;
//    NSLog(@"%@",self.superview.subviews);
    for (UIView *subView in self.superview.subviews) {
        if (subView.tag == self.Tag) {
            button = (UIButton *)subView;
        }

    }
    if (_show) {
        /**
            1. 第一个参数是  弹簧动画的时间
            2. 第二个参数是  弹簧动画延迟时间
            3. 第三个参数是  弹簧动画的阻尼值，也就是相当于摩擦力的大小，该属性的值从0.0到1.0之间，越靠近0，阻尼越小，弹动的幅度越大，反之阻尼越大，弹动的幅度越小，如果大道一定程度，会出现弹不动的情况
            4. 弹簧动画的速率，或者说是动力。值越小弹簧的动力越小，弹簧拉伸的幅度越小，反之动力越大，弹簧拉伸的幅度越大。这里需要注意的是，如果设置为0，表示忽略该属性，由动画持续时间和阻尼计算动画的效果
         */
        [UIView animateWithDuration:0.3 delay:0 usingSpringWithDamping:1 initialSpringVelocity:0.6 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            
            //在这里修改所需要显示视图的位置以及宽高，可以根据需要自行修改
            self.frame =CGRectMake(CGRectGetMinX(button.frame)- 10,CGRectGetMinY(button.frame)-(self.frame.size.height-button.frame.size.height)/2, -200,30);
            self.button1.frame = CGRectMake(10, 5, (self.frame.size.width-40)/2, self.frame.size.height - 10);
            
            self.button2.frame = CGRectMake(CGRectGetMaxX(self.button1.frame)+20, 5, (self.frame.size.width-40)/2, self.frame.size.height - 10);
//            self.alpha = 1;
//            self.button1.alpha = 1;
//            self.button2.alpha = 1;
        } completion:^(BOOL finished) {
        }];
    } else {
        [UIView animateWithDuration:0.3 delay:0 usingSpringWithDamping:1 initialSpringVelocity:0.6 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            
            //按钮1
            self.button1.frame = CGRectMake(10, 5, 0, self.frame.size.height - 10);
            //按钮2
            self.button2.frame = CGRectMake(0, 5, 0, self.frame.size.height - 10);

            //底部视图
            self.frame =CGRectMake(CGRectGetMinX(button.frame)- 10,CGRectGetMinY(button.frame)-(self.frame.size.height-button.frame.size.height)/2, 0,30);
//            self.alpha = 0;
//            self.button1.alpha = 0;
//            self.button2.alpha = 0;
        } completion:^(BOOL finished) {
            
        }];
    }
}

- (UIButton *)creatButtonWithTitle:(NSString *)title image:(UIImage *)image selImage:(UIImage *)selImage target:(id)target selector:(SEL)sel
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setImage:image forState:UIControlStateNormal];
    [btn setImage:selImage forState:UIControlStateSelected];
    [btn addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, 3, 0, 0);
    return btn;
}

#pragma mark ----按钮点击事件
//点赞
- (void)giveLikeButtonClick
{
    if (self.likeButtonClickedOperation) {
        self.likeButtonClickedOperation();
    }
    self.show = NO;
}

//评论
- (void)commentButtonClick
{
    if (self.commentButtonClickedOperation) {
        self.commentButtonClickedOperation();
    }
    self.show = NO;
}

@end
