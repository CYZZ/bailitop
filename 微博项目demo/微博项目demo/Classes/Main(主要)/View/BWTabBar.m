//
//  BWTabBar.m
//  微博项目demo
//
//  Created by KWSD_F on 15/12/31.
//  Copyright © 2015年 apple. All rights reserved.
//

#import "BWTabBar.h"

@interface BWTabBar ()
@property (nonatomic, weak) UIButton *plusBtn;
@end

@implementation BWTabBar

@synthesize delegate = _delegate;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 添加一个按钮到tabbar
        UIButton *plusBtn = [[UIButton alloc] init];
        [plusBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
        [plusBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
        [plusBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"]forState:UIControlStateNormal];
        [plusBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
        plusBtn.size = plusBtn.currentBackgroundImage.size;
        [plusBtn addTarget:self action:@selector(plusClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:plusBtn];
        self.plusBtn = plusBtn;
//        BWLog(@"%@", self.plusBtn);
    }
    return self;
}

/**
 *  添加按钮点击事件
 */
- (void)plusClick
{
    // 通知代理
    if ([self.delegate respondsToSelector:@selector(tabBarDidClickPlusButton:)]) {
        [self.delegate tabBarDidClickPlusButton:self];
    }
}
/**
 *   对tabBar的按钮重新布局
 */
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 1.设置中间新建微博加号按钮的位置
    self.plusBtn.centerX = self.width * 0.5;
    self.plusBtn.centerY = self.height * 0.5;
    BWLog(@"%f", self.plusBtn.centerX);
    BWLog(@"%f", self.plusBtn.centerY);
    // 2.设置其他tabbarButton的位置和尺寸
    CGFloat tabbarButtonW = self.width / 5; // 设置每个按钮的宽度
    CGFloat tabbarButtonIndex = 0; // tabbarButton的索引
    for (UIView *child in self.subviews) {
        Class class = NSClassFromString(@"UITabBarButton"); // 找出属于UITabBarButton的类
        if ([child isKindOfClass:class]) {
            // 设置按钮的宽度
            child.width = tabbarButtonW;
            // 设置按钮的横坐标x
            child.x = tabbarButtonIndex * tabbarButtonW;
            
            // 索引递增
            tabbarButtonIndex ++;
            if (tabbarButtonIndex == 2) {
                tabbarButtonIndex ++;
            }
            
        }
    }
}
@end
