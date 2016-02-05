    //
//  BWOAuthViewController.m
//  微博项目demo
//
//  Created by KWSD_F on 16/1/20.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "BWOAuthViewController.h"

@interface BWOAuthViewController ()

@end

@implementation BWOAuthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1.创建webView
    UIWebView *webView = [[UIWebView alloc] init];
    webView.frame = self.view.bounds;
    [self.view addSubview:webView];
    
    
    // 2.用webView加载登陆界面（新浪微博提供）
    // 请求地址：
    // 请求参数：
    NSURL *url = [NSURL URLWithString:@"https://api.weibo.com/oauth2/authorize?client_id=2667442399&response_type=code&redirect_uri=http://www.baidu.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
}


@end