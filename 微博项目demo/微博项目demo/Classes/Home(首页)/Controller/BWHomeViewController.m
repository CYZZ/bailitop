//
//  BWHomeViewController.m
//  微博项目demo
//
//  Created by KWSD_F on 15/12/25.
//  Copyright © 2015年 apple. All rights reserved.
//

#import "BWHomeViewController.h"
#import "BWDropdownMenu.h"
#import "BWTitleMenuViewController.h"

@interface BWHomeViewController () <BWDropdownMenuDelegate>

@end

@implementation BWHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置导航栏上面的内容
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(friendSearch) image:@"navigationbar_friendsearch" highImage:@"navigationbar_friendsearch_highlighted"];
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(pop) image:@"navigationbar_pop" highImage:@"navigationbar_pop_highlighted"];
    
    UIButton *titleButton = [[UIButton alloc] init];
    titleButton.width = 150;
    titleButton.height = 30;
//    titleButton.backgroundColor = BWRandomColor;
//    self.navigationItem.titleView = titleButton;
    
    // 设置图片和文字
    [titleButton setTitle:@"首页" forState:UIControlStateNormal];
    [titleButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    titleButton.titleLabel.font = [UIFont boldSystemFontOfSize:17];
    [titleButton setImage:[UIImage imageNamed:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
    [titleButton setImage:[UIImage imageNamed:@"navigationbar_arrow_up"] forState:UIControlStateSelected];
    // 设置标题的文字和图片和边框的距离
    titleButton.imageEdgeInsets = UIEdgeInsetsMake(0, 70, 0, 0);
    titleButton.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 40);
    
    // 监听标题点击
    [titleButton addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView = titleButton;
    
    // 在拉伸图片的时候如果，某个方向有突起，那么这个方向就不能拉伸
    
    UIView *grayView = [[UIView alloc] init];
    grayView.width = 200;
    grayView.height = 70;
    grayView.x = 20;
    grayView.y = 30;
    grayView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:grayView];
    
    UIButton *btn = [[UIButton alloc] init];
    btn.width = 100;
    btn.height = 30;
    btn.x = 140;
    btn.y = 30;
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
    [grayView addSubview: btn];
}

/**
 *  点击标题的时候弹出视图
 */
- (void)titleClick:(UIButton *)titleButton
{
    // 1.创建下拉菜单
    BWDropdownMenu *menu = [BWDropdownMenu menu];
    
    // 设置代理
    menu.delegate = self;
    // 2.设置内容
    BWTitleMenuViewController *vc = [[BWTitleMenuViewController alloc] init];
    vc.view.width = 150;
    vc.view.height = 150;
    menu.contentController = vc;
    
    // 3.显示
    [menu showFrom:titleButton];
    
}

- (void)friendSearch
{
    NSLog(@"friendSearch");
}

- (void)pop
{
    NSLog(@"pop");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - BWDropdownMenuDelegate
- (void)dropdownMenuDidDismiss:(BWDropdownMenu *)menu
{
    UIButton *titleButton = (UIButton *)self.navigationItem.titleView;
    // 设置按钮的状态为未选中状态
    titleButton.selected = NO;
    BWLog(@"dropdownMenuDidDismiss");
    
}

- (void)dropDownMenuDidShow:(BWDropdownMenu *)menu
{
    UIButton *titleButton = (UIButton *)self.navigationItem.titleView;
    // 设置按钮的状态为选中状态
    titleButton.selected = YES;
//    self.navigationItem.titleView = (UIView *)titleButton;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}



@end
