//
//  UIBarButtonItem+Extension.m
//  微博项目demo
//
//  Created by KWSD_F on 15/12/28.
//  Copyright © 2015年 apple. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"

@implementation UIBarButtonItem (Extension)

/**
 *  自定义一个item
 *
 *  @param target    点击item后调用的那个对象
 *  @param action    点击item后调用target的那个方法
 *  @param image     背景图片
 *  @param highImage 高亮状态下的图片
 *
 *  @return <#return value description#>
 */
+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    // 设置图片
    [btn setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    // 设置尺寸
    btn.size = btn.currentBackgroundImage.size;
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

@end
