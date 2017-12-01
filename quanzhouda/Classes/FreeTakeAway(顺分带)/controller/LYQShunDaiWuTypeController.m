//
//  LYQShunDaiWuTypeController.m
//  quanzhouda
//
//  Created by pro on 2017/11/28.
//  Copyright © 2017年 pro. All rights reserved.
//

#import "LYQShunDaiWuTypeController.h"

@interface LYQShunDaiWuTypeController ()
@property (weak, nonatomic) IBOutlet UIButton *one;
@property (weak, nonatomic) IBOutlet UIButton *two;
@property (weak, nonatomic) IBOutlet UIButton *there;
@property (weak, nonatomic) IBOutlet UIButton *foru;
@property (weak, nonatomic) IBOutlet UIButton *fif;
@property (weak, nonatomic) IBOutlet UIButton *six;
@property (weak, nonatomic) IBOutlet UIButton *seven;
@property (weak, nonatomic) IBOutlet UIButton *eigt;
@property (weak, nonatomic) IBOutlet UIButton *nin;
@property (weak, nonatomic) IBOutlet UIButton *sure;

@property (nonatomic ,strong) NSMutableArray *types;

@end

@implementation LYQShunDaiWuTypeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.types = [NSMutableArray array];
    
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)btnClick:(UIButton *)sender {
    
    sender.selected = !sender.selected;
    
    if (sender.selected) {
        [self.types addObject:sender];
    }else{
        [self.types removeObject:sender];
    }
    
    
}


- (IBAction)sureClick:(id)sender {
    
    if (self.block) {
        
        NSString *str = nil;
        
        if (self.types.count == 2) {
            UIButton *one = self.types[0];
            UIButton *two = self.types[1];
             str = [NSString stringWithFormat:@"%@ %@",one.titleLabel.text,two.titleLabel.text];
               
        }
        if (self.types.count == 1) {
            UIButton *one = self.types[0];
       
           str = [NSString stringWithFormat:@"%@",one.titleLabel.text];
         
        }
        
      
           self.block(str,self.types);
 
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)dealloc{
    
    NSLog(@"---");
    
}

@end
