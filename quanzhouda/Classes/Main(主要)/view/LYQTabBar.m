
//
//  LYQTabBar.m
//  quanzhouda
//
//  Created by pro on 2017/11/22.
//  Copyright © 2017年 pro. All rights reserved.
//

#import "LYQTabBar.h"

@interface LYQTabBar()

/** 上一次点击的按钮 */
@property (nonatomic, weak) UIControl *previousClickedTabBarButton;

@end


@implementation LYQTabBar


-(void)layoutSubviews{
    [super layoutSubviews];
    
//    NSInteger count = self.items.count;
//    
//    CGFloat btnW = self.xmg_width / count;
//    CGFloat btnH = self.xmg_height;
//    CGFloat x = 0;
//    int i = 0;
//    
//    for (UIControl *tabBarButton in self.subviews) {
//        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
//            
//            if (i == 0 && self.previousClickedTabBarButton == nil) {
//                self.previousClickedTabBarButton = tabBarButton;
//            }
//            
//             i ++;
//            
//            x = i * btnW;
//            
//            tabBarButton.frame = CGRectMake(x, 0, btnW, btnH);
//           
//            
//             [tabBarButton addTarget:self action:@selector(tabBarButtonClick:) forControlEvents:UIControlEventTouchUpInside];
//        }
//    }
//    
//    
}

@end
