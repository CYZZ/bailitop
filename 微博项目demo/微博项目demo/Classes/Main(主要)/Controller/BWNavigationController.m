//
//  BWNavigationController.m
//  微博项目demo
//
//  Created by KWSD_F on 15/12/28.
//  Copyright © 2015年 apple. All rights reserved.
//

#import "BWNavigationController.h"

@interface BWNavigationController ()

@end

@implementation BWNavigationController

+ (void)initialize
{
    // 设置整个项目所有item的主题样式
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    
    // 设置普通状态
    // key:NS***AttributeName
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor orangeColor]; // 字体颜色
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:13]; // 字体大小
    [item setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    
    // 设置不可用状态
    NSMutableDictionary *disableTextAttrs = [NSMutableDictionary dictionary];
    disableTextAttrs[NSForegroundColorAttributeName] = [UIColor colorWithRed:0.6 green:0.6 blue:0.6 alpha:0.7];
    disableTextAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    [item setTitleTextAttributes:disableTextAttrs forState:UIControlStateDisabled];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/**
 *  重写这个方法目的：能够拦截所有push进来的控制器
 *
 *  @param viewController 即将push进来的控制器
 *  @param animated       动画效果
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) {
        // 这时push进来的控制器viewController，不是根控制器
        // 自动隐藏tabbar
        viewController.hidesBottomBarWhenPushed = YES;
        
        // 设置导航栏上面的内容
        // 设置左边的返回按钮
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(back) image:@"navigationbar_back" highImage:@"navigationbar_back_highlighted"];
        // 设置右边的更多按钮
        viewController.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(more) image:@"navigationbar_more" highImage:@"navigationbar_more_highlighted"];
    }
    // 重写父类的push方法
    [super pushViewController:viewController animated:animated];
}

/**
 *  导航栏左上角返回按钮
 */
- (void)back
{
#warning 这里要用self，不是self.navigationController
    // 因为self本来就是iygie导航控制器，self.navigationController这里是nil的
    [self popViewControllerAnimated:YES];
}

/**
 *  导航栏右上角返回根视图按钮
 */
- (void)more
{
    [self popToRootViewControllerAnimated:YES];
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
