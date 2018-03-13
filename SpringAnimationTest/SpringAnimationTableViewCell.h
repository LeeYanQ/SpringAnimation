//
//  SpringAnimationTableViewCell.h
//  SpringAnimationTest
//
//  Created by 训网高 on 2018/3/5.
//  Copyright © 2018年 训网高. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SpringAnimationDelegate <NSObject>

- (void)didClickLikeButtonInCell:(UITableViewCell *)cell;
- (void)didClickCommentButtonInCell:(UITableViewCell *)cell;
@end

@interface SpringAnimationTableViewCell : UITableViewCell

@property (nonatomic, assign) id<SpringAnimationDelegate>delegate;
@property (nonatomic, strong) UIButton *clickBtn;
@property (nonatomic, strong) UIView *animationView;
@end


