//
//  LYQOpinionViewController.m
//  quanzhouda
//
//  Created by pro on 2017/11/22.
//  Copyright © 2017年 pro. All rights reserved.
//

#import "LYQOpinionViewController.h"
#import <UITextView+BAKit.h>



@interface LYQOpinionViewController ()

@property (weak, nonatomic) IBOutlet UITextView *TextView;

@end

@implementation LYQOpinionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
 
    
    self.TextView.ba_placeholder = @"留下你的宝贵意见，让我们做得更好";
    self.TextView.ba_placeholderColor = [UIColor colorWithHexString:@"#acacac"];
    self.TextView.ba_placeholderFont = sysFont(14);
       self.navigationItem.leftBarButtonItem = [UIBarButtonItem creatLeftItemTarget:self action:@selector(black)];
    
}
-(void)black{
    [self.navigationController popViewControllerAnimated:YES];
}

// 提意见
- (IBAction)tijiaoyijianCLick:(UIButton *)sender {
}



@end
