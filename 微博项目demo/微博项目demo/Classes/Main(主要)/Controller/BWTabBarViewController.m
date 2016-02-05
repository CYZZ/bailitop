//
//  BWTabBarViewController.m
//  微博项目demo
//
//  Created by KWSD_F on 15/12/28.
//  Copyright © 2015年 apple. All rights reserved.
//

#import "BWTabBarViewController.h"
#import "BWHomeViewController.h"
#import "BWMessageCenterViewController.h"
#import "BWDiscoverViewController.h"
#import "BWProfileViewController.h"
#import "BWNavigationController.h"
#import "BWTabBar.h"

@interface BWTabBarViewController () <BWTabBarDelegate>

@end

@implementation BWTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1.初始化子控制器
    BWHomeViewController *home = [[BWHomeViewController alloc] init];
    [self addChildVc:home title:@"首页" iamge:@"tabbar_home" selectedImage:@"tabbar_home_selected"];
    
    BWMessageCenterViewController *messageCenter = [[BWMessageCenterViewController alloc] init];
    [self addChildVc:messageCenter title:@"消息" iamge:@"tabbar_message_center" selectedImage:@"tabbar_message_center_selected"];
    
    BWDiscoverViewController *discover = [[BWDiscoverViewController alloc] init];
    [self addChildVc:discover title:@"发现" iamge:@"tabbar_discover" selectedImage:@"tabbar_discover_selected"];
    
    BWProfileViewController *profile = [[BWProfileViewController alloc] init];
    [self addChildVc:profile title:@"我" iamge:@"tabbar_profile" selectedImage:@"tabbar_profile_selected"];
    // 2.更换系统自带的tabbar
    // self.tabBar = [[BWTabBar alloc] init]; // self.tabBar的属性是只读的不能直接赋值
    BWTabBar *tabBar = [[BWTabBar alloc] init];
    [self setValue:tabBar forKey:@"tabBar"]; // 使用kvc能够对只读属性的变量进行赋值
    
    
}
/**
 *  添加一个子控制器
 *
 *  @param childVc       子控制器
 *  @param title         标题
 *  @param image         图片
 *  @param selectedImag1e 选中的时候显示的图片
 */
- (void)addChildVc:(UIViewController *)childVc title:(NSString *)title iamge:(NSString *)image selectedImage:(NSString *)selectedImage
{
    // 设置子控制器的文字标题
    childVc.title = title; // 同时设置tabbar和navigationBar的文字
//    childVc.tabBarItem.title = title; // 设置tabbar的文字
//    childVc.navigationItem.title = title; // 设置navigationBar的文字
    
    // 设置子控制器的图片
    childVc.tabBarItem.image = [UIImage imageNamed:image];
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // 设置文字的样式
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = BWColor(123, 123, 123);
    NSMutableDictionary *selecTextAttrs = [NSMutableDictionary dictionary];
    selecTextAttrs[NSForegroundColorAttributeName] = [UIColor orangeColor];
    [childVc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [childVc.tabBarItem setTitleTextAttributes:selecTextAttrs forState:UIControlStateSelected];
//    childVc.view.backgroundColor = BWRandomColor;
    
    // 先给外面传进来的小控制器 包装一个导航控制器
    BWNavigationController *nav = [[BWNavigationController alloc] initWithRootViewController:childVc];
    // 添加为子控制器
    [self addChildViewController:nav];
    
    
}
#pragma mark - BWTabBarDelegate代理方法
- (void)tabBarDidClickPlusButton:(BWTabBar *)tabBar
{
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor grayColor];
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
