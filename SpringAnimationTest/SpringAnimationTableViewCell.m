//
//  SpringAnimationTableViewCell.m
//  SpringAnimationTest
//
//  Created by 训网高 on 2018/3/5.
//  Copyright © 2018年 训网高. All rights reserved.
//

#import "SpringAnimationTableViewCell.h"
#import "AnimationViewMenu.h"

@implementation SpringAnimationTableViewCell

{
    AnimationViewMenu *LyAnimationView;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self creatSubViews];
    }
    return self;
}

- (void)creatSubViews {
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveOperationButtonClickedNotification:) name:@"LYSpringAnimationNotification" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(operationMenuViewNotification) name:@"OperationMenuViewNotification" object:nil];
    self.clickBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.clickBtn.frame = CGRectMake(self.frame.size.width-20, 30, 30, 20);
    [self.clickBtn setTitle:@"点我" forState:UIControlStateNormal];
    [self.clickBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.clickBtn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    self.clickBtn.backgroundColor = [UIColor blackColor];
    [self addSubview:self.clickBtn];
    
    /*
      1. 此处需要计算Y值，为了确保视图展示的时候的流畅度
     */
    LyAnimationView  = [[AnimationViewMenu alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.clickBtn.frame)-10, 25, 0, 30)];
    LyAnimationView.backgroundColor = [UIColor blackColor];
//    LyAnimationView.alpha = 0;
    [self addSubview:LyAnimationView];

    __weak typeof(self) weakSelf = self;
    //点赞
    [LyAnimationView setLikeButtonClickedOperation:^{
        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(didClickLikeButtonInCell:)]) {
            [weakSelf.delegate didClickLikeButtonInCell:weakSelf];
        }
    }];
    
    //评论
    [LyAnimationView setCommentButtonClickedOperation:^{
        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(didClickCommentButtonInCell:)]) {
            [weakSelf.delegate didClickCommentButtonInCell:weakSelf];
        }
    }];
    
}

- (void)click:(UIButton *)sender {
    LyAnimationView.Tag = sender.tag;
    [self postOperationButtonClickedNotification];
    LyAnimationView.show = !LyAnimationView.isShowing;
    NSLog(@"%ld",sender.tag);
}

//发送通知
- (void)postOperationButtonClickedNotification
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"LYSpringAnimationNotification" object:_clickBtn];
}


- (void)operationMenuViewNotification {
    [self postOperationButtonClickedNotification];
    if (LyAnimationView.isShowing) {
        LyAnimationView.show = NO;
    }
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    [self postOperationButtonClickedNotification];
    if (LyAnimationView.isShowing) {
        LyAnimationView.show = NO;
    }
}

- (void)receiveOperationButtonClickedNotification:(NSNotification *)notification
{
    UIButton *btn = [notification object];
    
    if (btn != _clickBtn && LyAnimationView.isShowing) {
        LyAnimationView.show = NO;
    }
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
