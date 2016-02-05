//
//  BWSearchBar.m
//  微博项目demo
//
//  Created by KWSD_F on 15/12/30.
//  Copyright © 2015年 apple. All rights reserved.
//

#import "BWSearchBar.h"

@implementation BWSearchBar

// 当调用init方法的时候就会调用这个方法
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.font = [UIFont systemFontOfSize:15];
        self.placeholder = @"请输入搜索条件";
        self.background = [UIImage imageNamed:@"searchbar_textfield_background"];
        
        // 通过init来创建初始化绝大部分控件，控件都是没有尺寸的
        UIImageView *searchIcon = [[UIImageView alloc] init];
        searchIcon.image = [UIImage imageNamed:@"searchbar_textfield_search_icon"];
        searchIcon.width = 30;
        searchIcon.height = 30;
        searchIcon.contentMode = UIViewContentModeCenter;
        self.leftView = searchIcon;
        self.leftViewMode = UITextFieldViewModeAlways; // 显示状态为永久
    }
    return self;
}

+ (instancetype)searchBar
{
    return [[self alloc] init];
}

@end
