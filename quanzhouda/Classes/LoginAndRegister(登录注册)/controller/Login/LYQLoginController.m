//
//  LYQLoginController.m
//  quanzhouda
//
//  Created by pro on 2017/11/20.
//  Copyright © 2017年 pro. All rights reserved.
//

#import "LYQLoginController.h"
#import "LYQTabbarController.h"

#import "NSString+LYQCheckStr.h"

#import "LYQUser.h"


#import "LYQUserTool.h"

#import "LYQLoginAndRegisterRequest.h"
#import "LYQLoginParam.h"
#import "LYQLoginModel.h"

#import "LYQChoseWindowTool.h"



@interface LYQLoginController ()
@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UITextField *userPhone;
@property (weak, nonatomic) IBOutlet UIButton *blackBtn;

@property (weak, nonatomic) IBOutlet UITextField *passWordTextF;

@property (nonatomic ,strong) LYQLoginParam *loginParam;

@end

@implementation LYQLoginController


-(LYQLoginParam *)loginParam{
    
    if (_loginParam == nil) {
        _loginParam = [LYQLoginParam param];
    }
    
    return _loginParam;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.bgView.backgroundColor = [UIColor colorWithRed:0  green:0 blue:0 alpha:0.4];
    self.blackBtn.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    self.blackBtn.layer.cornerRadius = 25;
    self.blackBtn.layer.masksToBounds = YES;

    
}

#pragma mark -----------------登录---------------------
- (IBAction)loginClick:(UIButton *)sender {
    
    [self.view endEditing:YES];

    if ( ![NSString isMobileNumber:self.userPhone.text]) {
     
        show(@"手机号码错误");
      ///[SVProgressHUD showinfo:@"手机号码错误"];
        
        return ;
    }
    
    if (self.passWordTextF.text.length == 0) {
        show(@"请输入密码");
        return;
    }

    self.loginParam.phone = self.userPhone.text;
    self.loginParam.password = self.passWordTextF.text;

    
    [LYQLoginAndRegisterRequest POSTLoginParam:self.loginParam success:^(LYQLoginModel *model) {
        
        if (model.success) {
            
            [self.view endEditing:YES];
            [LYQUserTool save:model.user];
            
            [LYQChoseWindowTool choseWindowWithWindow:LYQKeyWindow];
            
        }else{
            show(model.text);
            
        }
        
    } failure:^(NSError *error) {
        
    }];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)blackClick:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.view endEditing:YES];
    
}

@end
