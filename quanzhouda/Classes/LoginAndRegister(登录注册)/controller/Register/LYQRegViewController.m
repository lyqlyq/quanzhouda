//
//  LYQRegViewController.m
//  quanzhouda
//
//  Created by pro on 2017/11/17.
//  Copyright © 2017年 pro. All rights reserved.
//

#import "LYQRegViewController.h"
#import "UITextField+Placeholder.h"
#import "NSString+LYQCheckStr.h"



#import "LYQTabbarController.h"

#import "LYQHudView.h"
#import "LYQUserTool.h"

#import "LYQRegisterModel.h"
#import "LYQRegisterParam.h"

#import "LYQCodeModel.h"
#import "LYQCodeParam.h"


#import "LYQLoginAndRegisterRequest.h"

#import "LYQChoseWindowTool.h"




#define SW  [UIScreen mainScreen].bounds.size.width
#define SH   [UIScreen mainScreen].bounds.size.height

#define  seleColor  [UIColor whiteColor]
#define  disSeleColor [UIColor grayColor]

#define textFTag 2000
#define lineTag 1000


@interface LYQRegViewController ()<UITextFieldDelegate>

@property (nonatomic ,strong) UIImageView *bgImageV;

@property (nonatomic ,strong) UIView *bgView;


@property (nonatomic ,strong) UILabel *sendCodeBtn;

@property (nonatomic ,strong) UIButton *regBtn;

@property (nonatomic ,assign) NSInteger sencod;

@property (nonatomic ,strong) NSTimer *timer;

@property (nonatomic ,strong) LYQCodeParam *codeParam;
@property (nonatomic ,strong) LYQCodeModel *codeModel;

@property (nonatomic ,strong) LYQRegisterParam *registerParam;
@property (nonatomic ,strong) LYQRegisterModel *registerModel;






@end

@implementation LYQRegViewController


-(LYQCodeParam *)codeParam{
    
    if (_codeParam == nil) {
        _codeParam = [LYQCodeParam param];
    }
    return _codeParam;
    
}

-(LYQCodeModel *)codeModel{
    
    if (_codeModel == nil) {
        _codeModel = [LYQCodeModel model];
        
    }
    
    return _codeModel;
    
}

-(LYQRegisterParam *)registerParam{
    
    if (_registerParam == nil) {
        _registerParam = [LYQRegisterParam param];
    }
    
    return _registerParam;
    
}

-(LYQRegisterModel *)registerModel{
    
    if (_registerModel == nil) {
        _registerModel = [LYQRegisterModel model];
    }
    
    return _registerModel;
}




- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.sencod = 60;

    
  
    self.bgImageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0,SW , SH)];
    self.bgImageV.image = [UIImage imageNamed:@"bgReg"];
    [self.view addSubview:self.bgImageV];

    self.bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SW, SH)];
    self.bgView.backgroundColor = [UIColor blackColorWithDetfaleAlpha];

    
    UIImageView *imageLogo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo"]];
    
    imageLogo.xmg_width = 42;
    imageLogo.xmg_height = 49;
    imageLogo.xmg_x = (SW - imageLogo.xmg_width) * 0.5;
    imageLogo.xmg_y = 80;
    [self.bgView addSubview:imageLogo];
    
    
    
    CGFloat lineX = 50;
    CGFloat lineW = SW - 2 * lineX;
    CGFloat lineH = 0.5;
    CGFloat lineY = 200;
    CGFloat lineY_downY = 70;
    
    

    CGFloat textF_H = 50;
    CGFloat textF_Y = lineY - textF_H - lineH;
    CGFloat textF_X = lineX;

    NSArray *arr = @[@"请输入手机号",@"输入验证码",@"输入密码",@"确认密码"];
    NSString *tiStr = @"注册即表示同意全州达用户注册协议";
    
    
    for(int i = 0 ; i < 4 ;i ++){
        
        UIView *line  = [[UIView alloc] initWithFrame:CGRectMake(lineX, lineY + i * lineY_downY, lineW, lineH)];
        line.backgroundColor = [UIColor grayColor];
        CGFloat add_textY = textF_H + lineH + (lineY_downY - textF_H);
        UITextField *textF = [[UITextField alloc] initWithFrame:CGRectMake(textF_X,textF_Y + (i *add_textY) , lineW, textF_H)];
        textF.placeholder = arr[i];
        textF.delegate = self;
        textF.tintColor = [UIColor orangeColor];
        line.tag = i + lineTag;
        textF.tag = i + textFTag;
        textF.textColor = seleColor;

        if (i == 0 ) {
             line.backgroundColor = disSeleColor;
            textF.placeholderColor = disSeleColor;
         
            textF.xmg_width = 150;

            textF.keyboardType = UIKeyboardTypeNumberPad;
            
            self.sendCodeBtn = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(textF.frame), textF_Y + 5, lineW - textF.xmg_width - 10, textF_H - 10)];
            self.sendCodeBtn.text = @"发送验证码";
            self.sendCodeBtn.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:alphaColor];
            
            self.sendCodeBtn.layer.cornerRadius = 20;
            self.sendCodeBtn.layer.masksToBounds = YES;
            self.sendCodeBtn.textColor = seleColor;
            self.sendCodeBtn.textAlignment = NSTextAlignmentCenter;
            
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sendCodeBtnClick:)];
            
            [self.sendCodeBtn addGestureRecognizer:tap];
            self.sendCodeBtn.userInteractionEnabled = YES;
            

            
            
        }else{
            if (i == 1) {
                textF.keyboardType = UIKeyboardTypeNumberPad;
            }else{
                textF.secureTextEntry = YES;                
            }
            
            textF.placeholderColor = disSeleColor;
        }
 
        [self.bgView addSubview:line];
        [self.bgView addSubview:textF];
        [self.bgView addSubview:self.sendCodeBtn];
   
        
    }
    
    
    CGFloat tiLabelY = lineY + 3 * lineY_downY + 15;
    
    UILabel *tiLabel = [[UILabel alloc] init];
    tiLabel.xmg_x = lineX + 20;
    tiLabel.xmg_y = tiLabelY;
    tiLabel.text = tiStr;
    [tiLabel sizeToFit];
    tiLabel.textColor = [UIColor colorWithRed:48/255.0 green:119/255.0 blue:157/255.0 alpha:1];
    tiLabel.font = [UIFont systemFontOfSize:14];
    
    CGFloat regBtnX = lineX - 10;
    CGFloat regBtnY = tiLabelY + 50;
    CGFloat regBtnW = SW - 2*regBtnX;
    CGFloat regBtnH = 48;
    
    
    
    UIButton *regBtn =[ [UIButton alloc] initWithFrame:CGRectMake(regBtnX,regBtnY,regBtnW, regBtnH)];
    regBtn.titleLabel.font=[UIFont systemFontOfSize:18];
    [regBtn setBackgroundImage:[UIImage imageNamed:@"btnBG"] forState:UIControlStateNormal];
    regBtn.titleLabel.textColor = [UIColor whiteColor];
    [regBtn setTitle:@"注册" forState:UIControlStateNormal];
    [regBtn addTarget:self action:@selector(regBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.bgView addSubview:regBtn];
    [self.bgView addSubview:tiLabel];
    [self.bgView addSubview:regBtn];
    
  
    CGFloat blcak_Y = regBtnY + 30 + regBtnH;
    CGFloat blcak_W = 50;
    CGFloat blcak_H = 50;
    CGFloat blcak_X = (SW - 40) * 0.5;



    UIButton  * blcakBtn  = [[UIButton alloc] init];
    blcakBtn.xmg_x = blcak_X;
    blcakBtn.xmg_y = blcak_Y;
    blcakBtn.xmg_width = blcak_W;
    blcakBtn.xmg_height = blcak_H;
    blcakBtn.layer.cornerRadius = blcak_W * 0.5;
    blcakBtn.layer.masksToBounds = YES;
    
    [blcakBtn setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:alphaColor]];
    [blcakBtn setTitle:@"<-" forState:UIControlStateNormal];
    [blcakBtn addTarget:self action:@selector(blackClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.bgView addSubview:blcakBtn];
    [self.view addSubview:self.bgView];
    
 
    
}
#pragma mark -----------------返回---------------------
-(void)blackClick:(UIButton *)black{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark -----------------注册---------------------
-(void)regBtnClick:(UIButton *)reg{
    
    UITextField *phone = [self.view viewWithTag:textFTag];
    UITextField *code = [self.view viewWithTag:textFTag + 1];
    UITextField *pass = [self.view viewWithTag:textFTag + 2];
    UITextField *passOne = [self.view viewWithTag:textFTag + 3];
    
    
    
    if (phone.text.length > 0 && code.text.length > 0 && pass.text.length > 0 && passOne.text.length > 0) {
        
       
        
        if (![NSString  checkPassword:pass.text]) {
//            [SVProgressHUD show:@"密码为6-18位数字和字母组合" delay:1];
            show(@"密码为6-18位数字和字母组合");
            return;
        }else{
            // 判断密码是否一致
            if ([pass.text isEqualToString:passOne.text]) {
        
                
                self.registerParam.phone = phone.text;
                self.registerParam.code = code.text;
                self.registerParam.password = pass.text;
                
                [LYQLoginAndRegisterRequest POSTRegisterParam:self.registerParam success:^(LYQLoginAndRegistBaseModel *model) {
                    
                    
                } failure:^(NSError *error) {
                    
                }];
                
                
                [LYQLoginAndRegisterRequest POSTRegisterParam:self.registerParam success:^(LYQRegisterModel *model) {
                    if (model.success) {
                          [LYQUserTool save:model.user];
                        [LYQChoseWindowTool choseWindowWithWindow:LYQKeyWindow];
                         [self.view endEditing:YES];
                    }else{
                        
                           show(model.text);
                        
                    }
                } failure:^(NSError *error) {
                    
                }];
                
            }else{
            //    [SVProgressHUD showinfo:@"两次密码不一致"];
                show(@"两次密码不一致");
            }
            
        }

        
    }else{

        
        if (phone.text.length == 0) {
            show(@"请输入手机号");
            return;
        }
        
        if (code.text.length == 0) {
            show(@"请输入验证码");
            return;
            
        }
        
        if (pass.text.length == 0) {
            show(@"请输入密码");
            return;

        }
      
        if (passOne.text.length == 0) {
            show(@"请确认密码");
            return;

        }
        
        
        
    }

    
}




#pragma mark -----------------获取验证码---------------------
-(void)sendCodeBtnClick:(UILabel *)label{
    
    UITextField *phone = [self.view viewWithTag:textFTag];

    if (![NSString isMobileNumber:phone.text]) {
       // [SVProgressHUD showinfo:@"手机号码错误"];
        show(@"手机号码错误");
        return;
    }else{
        
    
        
        self.codeParam.phone = phone.text;
        
        self.sendCodeBtn.userInteractionEnabled  = NO;

        
        [LYQLoginAndRegisterRequest POSTCodeParam:self.codeParam success:^(LYQLoginAndRegistBaseModel *model) {
            [self changeSendLabeStatus];
        } failure:^(NSError *error) {
             self.sendCodeBtn.userInteractionEnabled = YES;
        }];
    }
    

    
}

-(void)changeSendLabeStatus{
   self.timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(changeLabel) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
}

-(void)changeLabel{
  
    self.sencod -- ;
    
    if (self.sencod == 0) {
                    self.sendCodeBtn.text = @"获取验证码";
                    self.sendCodeBtn.userInteractionEnabled = YES;
                    self.sencod = 60;
                    self.sendCodeBtn.userInteractionEnabled = YES;
        
                   [self.timer invalidate];
                    self.timer = nil;

                }else{
                       self.sendCodeBtn.text = [NSString stringWithFormat:@"%ld (s)",self.sencod];
                }
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    
    textField.placeholderColor = disSeleColor;
     UIView *line =  [self.view viewWithTag:textField.tag - lineTag];
    line.backgroundColor = disSeleColor;
    
    
}

-(void)textFieldDidBeginEditing:(UITextField *)textField{
   
    UIView *line =  [self.view viewWithTag:textField.tag - lineTag];
    line.backgroundColor = seleColor;
    textField.placeholderColor = seleColor;
    
}



-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
