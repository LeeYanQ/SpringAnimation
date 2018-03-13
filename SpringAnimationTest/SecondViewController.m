//
//  SecondViewController.m
//  SpringAnimationTest
//
//  Created by 训网高 on 2018/3/5.
//  Copyright © 2018年 训网高. All rights reserved.
//

#import "SecondViewController.h"
#import "AnimationViewMenu.h"
@interface SecondViewController ()
{
    AnimationViewMenu *animationView;
    UIButton *button;
    CGPoint animationPoint;

}
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
//    // 创建Button
//    button = [UIButton buttonWithType:UIButtonTypeSystem];
//    button.layer.borderWidth = 0.5f;
//    button.layer.cornerRadius = 7.0f;
//    button.frame = CGRectMake(240, 90, 60, 25);
//    [button setTitle:@"动画" forState:UIControlStateNormal];
//    [button addTarget:self action:@selector(showAnimation) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:button];
//    //  动画缩放开始的点
//    animationPoint = CGPointMake(button.frame.origin.x + button.frame.size.width / 2, 0);
//
//    //  动画view
//    animationView = [[UIView alloc] initWithFrame:CGRectMake(20, button.frame.origin.y, 215, 100)];
//    animationView.backgroundColor = [UIColor grayColor];
//    animationView.layer.cornerRadius = 7.0f;
//    animationView.alpha = 0.0f;
//    [self.view addSubview:animationView];

    
    
    
    
    
    button = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width-50,100, 30,20)];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    button.backgroundColor = [UIColor redColor];
    button.tag = 10000;
    [self.view addSubview:button];
    
    animationView  = [[AnimationViewMenu alloc] initWithFrame:CGRectMake(CGRectGetMinX(button.frame)- 10, CGRectGetMinY(button.frame) - (50-20)/2, 0, 50)];
    animationView.backgroundColor = [UIColor blackColor];
    animationView.alpha = 0;

    [self.view addSubview:animationView];
    
//    [animationView.button1 addTarget:self action:@selector(button1Click:) forControlEvents:UIControlEventTouchUpInside];
//    [animationView.button2 addTarget:self action:@selector(button2Click:) forControlEvents:UIControlEventTouchUpInside];
    
    
//    animationView.button1 = [UIButton buttonWithType:UIButtonTypeCustom];
//    animationView.button1.frame = CGRectMake(10, 5, (animationView.frame.size.width-40)/2, animationView.frame.size.height - 10);
//    animationView.button1.alpha = 0;
//    [animationView.button1 setTitle:@"第一个" forState:UIControlStateNormal];
//    animationView.button1.backgroundColor = [UIColor redColor];
//    [animationView addSubview:animationView.button1];
//    
//    
//    animationView.button2 = [UIButton buttonWithType:UIButtonTypeCustom];
//    animationView.button2.frame = CGRectMake(0, 5, 0, animationView.frame.size.height - 10);
//    animationView.button2.alpha = 0;
//    [animationView.button2 setTitle:@"第二个" forState:UIControlStateNormal];
//    animationView.button2.backgroundColor = [UIColor redColor];
//    [animationView addSubview:animationView.button2];
    
//    [UIView animateWithDuration:1 delay:0.5 usingSpringWithDamping:0.3 initialSpringVelocity:0.6 options:UIViewAnimationOptionCurveEaseInOut animations:^{
//
//        button.frame =CGRectMake(100,400, 100,50);
//
//    } completion:^(BOOL finished) {
//
//    }];

}

- (void)buttonClick:(UIButton *)sender {
    animationView.show = !animationView.isShowing;
}


- (void)click:(UIButton *)sender {
    if (animationView.alpha == 0) {
        [UIView animateWithDuration:0.3 delay:0 usingSpringWithDamping:1 initialSpringVelocity:0.6 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            
            animationView.frame =CGRectMake(CGRectGetMinX(button.frame)- 10,100, -200,50);
            animationView.alpha = 1;
            animationView.button1.frame = CGRectMake(10, 5, (animationView.frame.size.width-40)/2, animationView.frame.size.height - 10);
            animationView.button1.alpha = 1;
            
            animationView.button2.frame = CGRectMake(CGRectGetMaxX(animationView.button1.frame)+20, 5, (animationView.frame.size.width-40)/2, animationView.frame.size.height - 10);
            animationView.button2.alpha = 1;
        } completion:^(BOOL finished) {
        }];
    } else {
        [UIView animateWithDuration:0.3 delay:0 usingSpringWithDamping:1 initialSpringVelocity:0.6 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            
            //按钮1
            animationView.button1.frame = CGRectMake(10, 5, 0, animationView.frame.size.height - 10);
            //按钮2
            animationView.button2.frame = CGRectMake(0, 5, 0, animationView.frame.size.height - 10);
            //底部视图
            animationView.frame =CGRectMake(CGRectGetMinX(button.frame)- 10,100, 0,50);
            animationView.alpha = 0;
            animationView.button1.alpha = 0;
            
            
            animationView.button2.alpha = 0;
        } completion:^(BOOL finished) {
            
        }];
    }
    
}

- (void)showAnimation {
    
//    CGFloat offsetX = animationPoint.x - self.view.frame.size.width / 2;
//    CGFloat offsetY = animationPoint.y - animationView.frame.size.height / 2;
//
//    if (animationView.alpha == 0.0f) {
//        // 动画由小变大
////        animationView.transform = CGAffineTransformMake(0.01, 0, 0, 0.01, offsetX, offsetY);
//        animationView.transform = CGAffineTransformMakeScale(0, 0);
//        [UIView animateWithDuration:0.3f animations:^{
//            animationView.alpha = 1.0f;
////            animationView.transform = CGAffineTransformMake(1.05f, 0, 0, 1.0f, 0, 0);
//            animationView.transform = CGAffineTransformMakeScale(1, 1);
//
//        } completion:^(BOOL finished) {
////            [UIView animateWithDuration:0.1f animations:^{
////                animationView.transform = CGAffineTransformMake(1, 0, 0, 1, 0, 0);
////            } completion:^(BOOL finished) {
////                //  恢复原位
////                animationView.transform = CGAffineTransformIdentity;
////            }];
//        }];
//
//    } else {
//
//        // 动画由大变小
////        animationView.transform = CGAffineTransformMake(1, 0, 0, 1, 0, 0);
//        animationView.transform = CGAffineTransformMakeScale(1, 1);
//        [UIView animateWithDuration:0.2 animations:^{
////            animationView.transform = CGAffineTransformMake(0.01, 0, 0, 0.01, offsetX, offsetY);
//            animationView.alpha = 0.0f;
//            animationView.transform = CGAffineTransformMakeScale(0, 0);
//        } completion:^(BOOL finished) {
////            animationView.transform = CGAffineTransformIdentity;
////            animationView.alpha = 0.0f;
//        }];
//    }
    
}


#pragma mark ---- 多按钮点击事件
- (void)button1Click:(UIButton *)sender {
    NSLog(@"第一个按钮");
}

- (void)button2Click:(UIButton *)sender {
    NSLog(@"第二个按钮");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
