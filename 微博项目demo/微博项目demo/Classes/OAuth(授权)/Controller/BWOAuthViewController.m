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
    
//    // 1.创建webView
    UIWebView *webView = [[UIWebView alloc] init];
    webView.frame = self.view.bounds;
    [self.view addSubview:webView];
    
    NSString *txtPath = [[NSBundle mainBundle] pathForResource:@"htmlDemo" ofType:@"html"];
    NSLog(@"txtpath: %@",txtPath);
    
    // 编码可以解决.txt中文显示乱码的问题
//    NSStringEncoding *useEncoding = nil;
    
//    // 带编码头的如utf-8等会被识别出来
//    NSString *body = [NSString stringWithContentsOfFile:txtPath encoding:useEncoding error:nil];
//    
//    // 识别不到，按GBK编码在解码一次，这里不能先按GB180303编码否则无换行
//    if (!body) {
//        body = [NSString stringWithContentsOfFile:txtPath encoding:0x80000632 error:nil];
//        NSLog(@"body = %@",body);
//    }
    
//    NSURL *fileUrl = [[NSBundle mainBundle] URLForResource:@"htmlDemo.html" withExtension:nil];
//    NSURLRequest *request = [NSURLRequest requestWithURL:fileUrl];
//    [webView loadRequest:request];
    
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"html代码" ofType:@"txt"];
    NSString *htmlString = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    if (!htmlString) {
        htmlString = [NSString stringWithContentsOfFile:filePath encoding:0x80000632 error:nil];
    }
    NSLog(@"htmlString = %@", htmlString);
    [webView loadHTMLString:htmlString baseURL:[NSURL URLWithString:filePath]];
//
//    
//    // 2.用webView加载登陆界面（新浪微博提供）
//    // 请求地址：
//    // 请求参数：
//    NSURL *url = [NSURL URLWithString:@"https://api.weibo.com/oauth2/authorize?client_id=2667442399&response_type=code&redirect_uri=http://www.baidu.com"];
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    [webView loadRequest:request];
}


@end