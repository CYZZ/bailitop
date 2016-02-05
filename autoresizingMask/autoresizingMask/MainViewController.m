//
//  MainViewController.m
//  autoresizingMask
//
//  Created by cyz on 16/2/5.
//  Copyright © 2016年 cyz. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()
{
    UIButton *_button; // 私有变量
}

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 添加一个Button
    _button = [[UIButton alloc] initWithFrame:CGRectMake(60, 100, 200, 60)];
    _button.backgroundColor = [UIColor orangeColor];
    [_button setTitle:@"Hello world!" forState:UIControlStateNormal];
    _button.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleLeftMargin;
    [self.view addSubview:_button];
}

#pragma mark 屏幕旋转事件
- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    NSLog(@"%@", NSStringFromCGRect(_button.frame));
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
