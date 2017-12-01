//
//  LYQTabbarController.m
//  quanzhouda
//
//  Created by pro on 2017/11/13.
//  Copyright © 2017年 pro. All rights reserved.
//

#import "LYQTabbarController.h"

#import "LYQBuypeiViewController.h"
#import "LYQShunCarViewController.h"
#import "LYQShunDaiViewController.h"
#import "MeViewController.h"
#import "LYQNavController.h"

#import "LYQTabBar.h"


@interface LYQTabbarController ()

@end

@implementation LYQTabbarController


// 只会调用一次
+ (void)load
{
    

    // 获取哪个类中UITabBarItem
    UITabBarItem *item = [UITabBarItem appearanceWhenContainedIn:self, nil];
    
    // 设置按钮选中标题的颜色:富文本:描述一个文字颜色,字体,阴影,空心,图文混排
    // 创建一个描述文本属性的字典
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    [item setTitleTextAttributes:attrs forState:UIControlStateSelected];
    
    // 设置字体尺寸:只有设置正常状态下,才会有效果
    NSMutableDictionary *attrsNor = [NSMutableDictionary dictionary];
    attrsNor[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    [item setTitleTextAttributes:attrsNor forState:UIControlStateNormal];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    

    
    LYQShunCarViewController *vc1 = [[LYQShunCarViewController alloc] init];
    [self setChildVc:[UIImage imageNamed:@"che"] seleImage:[UIImage imageNamed:@"chet"] titleName:@"顺风车" vc:vc1];

    LYQShunDaiViewController *vc2 = [[LYQShunDaiViewController alloc] init];
    [self setChildVc:[UIImage imageNamed:@"dait"] seleImage:[UIImage imageNamed:@"dai"] titleName:@"顺风带" vc:vc2];
    
    LYQBuypeiViewController *vc3 = [[LYQBuypeiViewController alloc] init];
    [self setChildVc:[UIImage imageNamed:@"peizhi"] seleImage:[UIImage imageNamed:@"peizhit"] titleName:@"买配置" vc:vc3];
    
    MeViewController *me = [[MeViewController alloc] init];
    [self setChildVc:[UIImage imageNamed:@"geren"] seleImage:[UIImage imageNamed:@"gerent"] titleName:@"个人中心" vc:me];
 
    LYQTabBar *tabbar = [[LYQTabBar alloc] init];
    [self setValue:tabbar forKey:@"tabBar"];
    
    
}



-(void)setChildVc:(UIImage *)norlImage seleImage:(UIImage *)seleImage titleName:(NSString *) name vc:(UIViewController *)vc{
    
    vc.tabBarItem.image = norlImage;
    vc.tabBarItem.selectedImage = [seleImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.title = name;
    LYQNavController *nav = [[LYQNavController alloc] initWithRootViewController:vc];
 
    

    

    [self addChildViewController:nav];
}


@end
