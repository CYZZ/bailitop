//
//  BWTabBar.h
//  微博项目demo
//
//  Created by KWSD_F on 15/12/31.
//  Copyright © 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BWTabBar;
#warning 因为BWTabBar继承自UITabBar，所以成为BWTabBar的代理，也必须实现UITabBar的代理协议
@protocol BWTabBarDelegate <UITabBarDelegate>
@optional
- (void)tabBarDidClickPlusButton:(BWTabBar *)tabBar;
@end
@interface BWTabBar : UITabBar

#warning 显式的声明一个 @Synthesize delegate = _delegate就能去除声明代理的警告
@property (nonatomic, weak) id<BWTabBarDelegate> delegate;

@end
