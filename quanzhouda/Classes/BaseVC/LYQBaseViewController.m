//
//  LYQBaseViewController.m
//  quanzhouda
//
//  Created by pro on 2017/11/30.
//  Copyright © 2017年 pro. All rights reserved.
//

#import "LYQBaseViewController.h"

@interface LYQBaseViewController ()

@end

@implementation LYQBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpVC];
}
-(void)setUpVC{
    
}
-(void)dealloc{
    NSLog(@"%@----控制器销毁",[self class]);
}

@end
