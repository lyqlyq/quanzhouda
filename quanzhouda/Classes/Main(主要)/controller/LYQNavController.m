//
//  LYQNavController.m
//  quanzhouda
//
//  Created by pro on 2017/11/13.
//  Copyright © 2017年 pro. All rights reserved.
//

#import "LYQNavController.h"

@interface LYQNavController ()<UIGestureRecognizerDelegate>


@end

@implementation LYQNavController

+(void)initialize{
    

    UINavigationBar *navBar = [UINavigationBar appearanceWhenContainedIn:self, nil];
    
    // 只要是通过模型设置,都是通过富文本设置
    // 设置导航条标题 => UINavigationBar
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:19];
    attrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    [navBar setTitleTextAttributes:attrs];
    
    // 设置导航条背景图片
    [navBar setBackgroundImage:[UIImage imageNamed:@"navBG"] forBarMetrics:UIBarMetricsDefault];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];

    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self.interactivePopGestureRecognizer.delegate action:@selector(handleNavigationTransition:)];
    
    [self.view addGestureRecognizer:pan];
    
    // 控制手势什么时候触发,只有非根控制器才需要触发手势
    pan.delegate = self;
    
    // 禁止之前手势
    self.interactivePopGestureRecognizer.enabled = NO;
    
    
    
}

#pragma mark - UIGestureRecognizerDelegate
// 决定是否触发手势
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    return self.childViewControllers.count > 1;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.childViewControllers.count > 0) { // 非根控制器
        
        // 恢复滑动返回功能 -> 分析:把系统的返回按钮覆盖 -> 1.手势失效(1.手势被清空 2.可能手势代理做了一些事情,导致手势失效)
        viewController.hidesBottomBarWhenPushed = YES;
        
        // 设置返回按钮,只有非根控制器
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem creatLeftItemTarget:self action:@selector(back)];
    }
    
    // 真正在跳转
    [super pushViewController:viewController animated:animated];
}

- (void)back
{
    [self popViewControllerAnimated:YES];
}



@end
