//
//  BWNewfeatureViewController.m
//  微博项目demo
//
//  Created by KWSD_F on 16/1/4.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "BWNewfeatureViewController.h"
#import "BWTabBarViewController.h"
#define  BWNewfeatureCount 4

@interface BWNewfeatureViewController () <UIScrollViewDelegate>
@property (nonatomic, weak) UIPageControl *pageControl;
@property (nonatomic, weak) UIScrollView *scrollView;

@end

@implementation BWNewfeatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 1.创建一个scrollView：显示所有新特性的图片
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.frame = self.view.bounds;
    [self.view addSubview:scrollView];
    self.scrollView = scrollView;
    
    // 2.添加图片到scrollView中
    CGFloat scrollW = scrollView.width;
    CGFloat scrollH = scrollView.height;
    for (int i = 0; i < BWNewfeatureCount; i++) {
        UIImageView *imageView =[[UIImageView alloc] init];
        imageView.width = scrollW;
        imageView.height = scrollH;
        imageView.y = 0;
        imageView.x = i * scrollW;
        
        // 显示图片
        
        NSString *name = [NSString stringWithFormat:@"new_feature_%d", i + 1];
        imageView.image = [UIImage imageNamed:name];
        [scrollView addSubview:imageView];
        
        // 如果是最后一个imageView，就往里面添加按钮等控件
        if (i == BWNewfeatureCount - 1) {
            [self setupLastImageView:imageView];
        }
    }
    // scrollView的其他属性
    // 如果想要某个方向上不能滚动，那么这个方向的尺寸数值传0即可
    scrollView.contentSize = CGSizeMake(BWNewfeatureCount * scrollW, 0);
    scrollView.bounces = NO; // 设置弹簧属性
    scrollView.pagingEnabled = YES; // 分页效果
    scrollView.showsHorizontalScrollIndicator = NO; // 水平方向的进度条属性为NO
    scrollView.delegate = self;
    
    // 添加pageControl：分页，展示目前看到的是第几页
    UIPageControl *pageControl = [[UIPageControl alloc] init];
    pageControl.numberOfPages = BWNewfeatureCount;
    pageControl.backgroundColor = [UIColor redColor];
    pageControl.currentPageIndicatorTintColor = BWColor(253, 189, 42); // 设置选中点得颜色
    pageControl.pageIndicatorTintColor = BWColor(189, 189, 189); // 设置未选中的点颜色
    pageControl.centerX = scrollView.frame.size.width * 0.5;
    pageControl.y = scrollH * 0.8;
    [self.view addSubview:pageControl];
    self.pageControl = pageControl;
    NSLog(@"%f", self.view.size.width);
    NSLog(@"pageControl = %f",_pageControl.centerX);
    // UIPageControl就算没有设置尺寸，里面的内容还是照常显示的
    pageControl.width = 100;
    pageControl.height = 50;
    pageControl.userInteractionEnabled = NO; // 设置pageControl的属性为不可点击
    
}

/**
 *  在滚动的时候频繁的调用
 */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    double page = scrollView.contentOffset.x / scrollView.width;
    // 四舍五入计算出页码
    self.pageControl.currentPage = (int)(page + 0.5);
    
}

/**
 *  初始化最后一个imageView
 *
 *  @param imageView 最后一个imageView
 */
- (void)setupLastImageView:(UIImageView *)imageView
{
    // 开启交互功能
    imageView.userInteractionEnabled = YES;
    
    // 1.分享给大家（checkBox）
    UIButton *shareBtn = [[UIButton alloc] init];
    [shareBtn setImage:[UIImage imageNamed:@"new_feature_share_false"] forState:UIControlStateNormal];
    [shareBtn setImage:[UIImage imageNamed:@"new_feature_share_true"] forState:UIControlStateSelected];
    [shareBtn setTitle:@"分享给大家" forState:UIControlStateNormal];
    [shareBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    shareBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    shareBtn.width = 200;
    shareBtn.height = 30;
    shareBtn.centerX = imageView.width * 0.5;
    shareBtn.centerY = imageView.height * 0.65;
    [shareBtn addTarget:self action:@selector(shareClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [imageView addSubview:shareBtn];
    // 设置按钮内部图片和文字的间距
    shareBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    
    // 2.开始微博
    UIButton *startBtn = [[UIButton alloc] init];
    [startBtn setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button"] forState:UIControlStateNormal];
    [startBtn setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button_highlighted"] forState:UIControlStateHighlighted];
    startBtn.size = startBtn.currentBackgroundImage.size;
    startBtn.centerX = shareBtn.centerX;
    startBtn.centerY = imageView.height * 0.75;
    [startBtn setTitle:@"开始微博" forState:UIControlStateNormal];
    [startBtn addTarget:self action:@selector(startClick) forControlEvents:UIControlEventTouchUpInside];
    [imageView addSubview:startBtn];
}

/**
 *  点击分享按钮，让按钮切换图片
 *
 *  @param shareBtn 分享按钮
 */
- (void)shareClick:(UIButton *)shareBtn
{
    // 选中状态取反
    shareBtn.selected = !shareBtn.isSelected;
}
/**
 *  点击开启微博
 */
- (void)startClick
{
    // 切换到BWTabBarController
    // 切换window的rootViewController
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    window.rootViewController = [[BWTabBarViewController alloc] init];
}
@end
