//
//  BWTest1ViewController.m
//  微博项目demo
//
//  Created by KWSD_F on 15/12/28.
//  Copyright © 2015年 apple. All rights reserved.
//

#import "BWTest1ViewController.h"
#import "BWTest2ViewController.h"

@interface BWTest1ViewController ()

@end

@implementation BWTest1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    BWTest2ViewController *test2 = [[BWTest2ViewController alloc] init];
    test2.title = @"测试2控制器";
    [self.navigationController pushViewController:test2 animated:YES];
    
}

@end
