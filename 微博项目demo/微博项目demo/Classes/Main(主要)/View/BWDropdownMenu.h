//
//  BWDropdownMenu.h
//  微博项目demo
//
//  Created by KWSD_F on 15/12/30.
//  Copyright © 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BWDropdownMenu;

@protocol BWDropdownMenuDelegate <NSObject>

@optional

- (void)dropdownMenuDidDismiss:(BWDropdownMenu *)menu;
- (void)dropDownMenuDidShow:(BWDropdownMenu *)menu;

@end

@interface BWDropdownMenu : UIView

@property (nonatomic, weak) id<BWDropdownMenuDelegate> delegate;
+ (instancetype)menu;

/**
 *  显示
 */
- (void)showFrom:(UIView *)from;

/**
 *  销毁
 */
- (void)dismiss;

/**
 *  内容
 */
@property (nonatomic, strong) UIView *content;

/**
 *  内容控制器
 */
@property (nonatomic, strong) UIViewController *contentController;

@end
