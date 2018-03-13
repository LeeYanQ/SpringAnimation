//
//  ViewController.m
//  SpringAnimationTest
//
//  Created by 训网高 on 2018/3/5.
//  Copyright © 2018年 训网高. All rights reserved.
//

#import "ViewController.h"
#import "SpringAnimationTableViewCell.h"
#import "SecondViewController.h"
@interface ViewController () <UITableViewDelegate,UITableViewDataSource,SpringAnimationDelegate>

@property (nonatomic, strong) UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    CASpringAnimation *springAnimation = [CASpringAnimation animationWithKeyPath:@"bounds"];
    self.title = @"弹簧动画测试";
    [self creatTableView];
}

- (void)creatTableView {
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.tableView registerClass:[SpringAnimationTableViewCell class] forCellReuseIdentifier:@"cell"];
    
    [self.view addSubview:self.tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SpringAnimationTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[SpringAnimationTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.clickBtn.tag = indexPath.row + 10000;
    cell.delegate = self;
//    [cell.clickBtn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}

#pragma mark ---- 按钮点击事件
- (void)buttonClick:(UIButton *)sender {
    NSLog(@"点击了");
    SecondViewController *vc = [[SecondViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}


#pragma mark ---- cell代理方法
- (void)didClickLikeButtonInCell:(UITableViewCell *)cell {
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    NSLog(@"rows = %ld",indexPath.row);
}

- (void)didClickCommentButtonInCell:(UITableViewCell *)cell {
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    NSLog(@"rows = %ld",indexPath.row);
}

#pragma mark ---- UIScrollowViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"OperationMenuViewNotification" object:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
