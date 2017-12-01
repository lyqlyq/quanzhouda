//
//  LYQSecuriTyViewController.m
//  quanzhouda
//
//  Created by pro on 2017/11/22.
//  Copyright © 2017年 pro. All rights reserved.
//

#import "LYQSecuriTyViewController.h"

@interface LYQSecuriTyViewController ()

@end

@implementation LYQSecuriTyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem creatLeftItemTarget:self action:@selector(black)];
    
}
-(void)black{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
