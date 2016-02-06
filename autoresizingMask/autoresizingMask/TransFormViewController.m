//
//  TransFormViewController.m
//  autoresizingMask
//

//  Created by cyz on 16/2/5.
//  Copyright © 2016年 cyz. All rights reserved.
//

#import "TransFormViewController.h"
// 定义rgb颜色
#define NORMAL_COLOR [UIColor colorWithRed:75/255.0 green:160/255.0 blue:253/255.0 alpha:1]
#define HIGHLIGHTED_COLOR [UIColor colorWithRed:197/255.0 green:221/255.0 blue:249/255.0 alpha:1]
// 按钮操作
typedef void(^ ButtonHandle)();
@interface TransFormViewController ()
{
    UIImageView *_imageView; // 图片空间
    UIButton *_btnRotation; // 旋转按钮
    UIButton *_btnScale; // 缩放按钮
    UIButton *_btnTranslate; // 移动按钮
}
@end

@implementation TransFormViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addImageView];
    [self addRotationButton];
    [self addScaleButton];
    [self addTranslateButton];
    
}

/**
 *  添加图片控件
 */
- (void)addImageView
{
    // 直接使用图片名称，系统会自动到资源文件找到对应的文件
    UIImage *image = [UIImage imageNamed:@"03"];
    // 如果使用initWithImage进行初始化则控件大小会自动设置成图片大小
    _imageView = [[UIImageView alloc] initWithImage:image];
    _imageView.frame = CGRectMake(20, 20, 300, 150);
    // 设置内容填充模式为等比填充
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    // self.view就是每个视图控制器中的view属性
    [self.view addSubview:_imageView];
}

/**
 *  添加旋转按钮
 */
- (void)addRotationButton
{
    _btnRotation = [self getButton];
    _btnRotation.frame = CGRectMake(20, 400, 300, 30);
    [_btnRotation setTitle:@"旋转" forState:UIControlStateNormal];
    // 添加按钮点击事件
    [_btnRotation addTarget:self action:@selector(rotation:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btnRotation];
}

/**
 *  添加缩放按钮
 */
- (void)addScaleButton
{
    // 在上面一个按钮位置的基础上确认当前位置,按钮的大小相同
    CGRect scaleButtonFrame = _btnRotation.frame;
    scaleButtonFrame.origin.y += 40;
    _btnScale = [self getButton];
    _btnScale.frame = scaleButtonFrame;
    [_btnScale setTitle:@"缩放" forState:UIControlStateNormal];
    // 添加按钮点击事件
    [_btnScale addTarget:self action:@selector(scale:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btnScale];
}
/**
 *  添加移动按钮
 */
- (void)addTranslateButton
{
    CGRect translateButtonFrame = _btnScale.frame;
    translateButtonFrame.origin.y += 40;
    _btnTranslate = [self getButton];
    _btnTranslate.frame = translateButtonFrame;
    [_btnTranslate setTitle:@"移动" forState:UIControlStateNormal];
    [_btnTranslate addTarget:self action:@selector(translate:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btnTranslate];
}
/**
 *  图片旋转方法
 *
 *  @param btn 当前点击按钮
 */
- (void)rotation:(UIButton *)btn
{
    [self animation:^{
        CGFloat anble = M_PI_4;
        _imageView.transform = CGAffineTransformRotate(_imageView.transform, anble);
    }];
}
/**
 *  图片缩放方法
 *
 *  @param btn 当前点击按钮
 */
- (void)scale:(UIButton *)btn
{
    // 通常我们使用UIView的静态方法实现动画而不是自己写一个方法
    [UIView animateWithDuration:0.5 animations:^{
        CGFloat scalleOffset = 0.9;
        _imageView.transform = CGAffineTransformScale(_imageView.transform, scalleOffset, scalleOffset);
    }];
    
}

/**
 *  图片移动方法
 *
 *  @param btn 当前点击按钮
 */
- (void)translate:(UIButton *)btn
{
    [self animation:^{
        CGFloat translateY = 50;
        _imageView.transform = CGAffineTransformTranslate(_imageView.transform, 0, translateY);
    }];
    
}
/**
 *  动画执行方法，注意这里可以使用UIView的animateWithDuration方法代替这里只是为了演示
 */
- (void)animation:(ButtonHandle)handle{
    // 开始动画
    [UIView beginAnimations:@"animation" context:nil];
    // 设置动画执行时间
    [UIView setAnimationDuration:0.5];
    handle();
    // 执行动画操作
    [UIView commitAnimations];
}
/**
 *  去的一个按钮，统一按钮样式
 */
- (UIButton *)getButton
{
    UIButton *button = [[UIButton alloc] init];
    // 设置正常状态下字体颜色
    [button setTitleColor:NORMAL_COLOR forState:UIControlStateNormal];
    // 设置高亮状态下的字体颜色
    [button setTitleColor:HIGHLIGHTED_COLOR forState:UIControlStateHighlighted];
    return button;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
