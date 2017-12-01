//
//  LYQBuypeiViewController.m
//  quanzhouda
//
//  Created by pro on 2017/11/13.
//  Copyright © 2017年 pro. All rights reserved.
//

#import "LYQBuypeiViewController.h"
#import "LYQTopVIew.h"

@interface LYQBuypeiViewController ()

@end

@implementation LYQBuypeiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    self.view.backgroundColor = [UIColor whiteColor];
    LYQTopVIew *top = [LYQTopVIew topView];
    top.frame = CGRectMake(0, 0, screen_W, 41);
    top.oneText = @"我要发布";
    top.twoText = @"已发布";
    top.inderView_W = 51;
    [self.view addSubview:top];


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
