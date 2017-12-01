

//
//  LYQLoginRegController.m
//  quanzhouda
//
//  Created by pro on 2017/11/20.
//  Copyright © 2017年 pro. All rights reserved.
//

#import "LYQLoginRegController.h"
#import "LYQRegViewController.h"
#import "LYQLoginController.h"

@interface LYQLoginRegController ()

@end

@implementation LYQLoginRegController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    [self setUpVC];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (IBAction)regClick:(UIButton *)sender {
    
    LYQRegViewController *reg = [[LYQRegViewController alloc] init];
    
    [self presentViewController:reg animated:YES completion:nil];
    
}

- (IBAction)loginClick:(UIButton *)sender {
    LYQLoginController *login = [[LYQLoginController alloc] init];
    [self presentViewController:login animated:YES completion:nil];
}

@end
