//
//  LYQSetUpViewController.m
//  quanzhouda
//
//  Created by pro on 2017/11/22.
//  Copyright © 2017年 pro. All rights reserved.
//

#import "LYQSetUpViewController.h"

#import "LYQLoginRegController.h"
#import "LYQUserTool.h"
#import "LYQSureAndCancleView.h"

#import "LYQOpinionViewController.h"
#import "LYQSecuriTyViewController.h"



@interface LYQSetUpViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic ,strong) UITableView *tab;

@property (nonatomic ,assign) CGRect  lastCellFrame;





@end

@implementation LYQSetUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
     [self.navigationController setNavigationBarHidden:NO animated:NO];

    
    self.tab = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screen_W, screen_H)];
    self.tab.backgroundColor = [UIColor colorWithHexString:@"#f7f7f7"];
    self.tab.dataSource = self;
    self.tab.delegate = self;
  
    self.view.backgroundColor =self.tab.backgroundColor;
    
    UIView *footer = [[UIView alloc] init];
    footer.backgroundColor = [UIColor colorWithHexString:@"#f7f7f7"];
    footer.frame = CGRectMake(0, 0, screen_W, screen_H - 64 - 49 - 4*44 - 40);
    
    UIButton *cancleLoginBtn = [[UIButton alloc] init];
    
    [cancleLoginBtn setTitle:@"退出登录" forState:UIControlStateNormal];
    [cancleLoginBtn setTintColor:[UIColor whiteColor]];
    cancleLoginBtn.titleLabel.font = sysFont(15);
    cancleLoginBtn.frame = CGRectMake(15, (footer.xmg_height - 42) * 0.5 + 90, screen_W - 30, 42);
    cancleLoginBtn.backgroundColor = [UIColor colorWithHexString:@"#424551"];
    [footer addSubview:cancleLoginBtn];
    [cancleLoginBtn addTarget:self action:@selector(cancelClick) forControlEvents:UIControlEventTouchUpInside];
    
    self.tab.tableFooterView = footer;
    [self.view addSubview:self.tab];
  
}

-(void)cancelClick{
    [LYQSureAndCancleView show].block = ^(NSString *str){
        
            [LYQUserTool remove];
        
            LYQLoginRegController *logVC = [[LYQLoginRegController alloc] init];
        
            [UIApplication sharedApplication].keyWindow.rootViewController = logVC;
    };
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2;
    
}

-(NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section == 0) {
        return 1;
    }
    return 4;
}

-(CGFloat )tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 10.0f;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
     
        LYQSecuriTyViewController *securityVC = [[LYQSecuriTyViewController alloc] init];
        securityVC.title = @"账号与安全";
        [self.navigationController pushViewController:securityVC animated:YES];
        
        
    }else{
        // 常用地址
        if (indexPath.row == 0) {
            
        }
        // 常见问题
        if (indexPath.row == 1) {
            
        }
        // 意见反馈
        if (indexPath.row == 2) {
            LYQOpinionViewController *opin = [[LYQOpinionViewController alloc] init];
            opin.title = @"意见反馈";
            [self.navigationController pushViewController:opin animated:YES];
        }
        // 关于我们
        if (indexPath.row == 3) {
            
        }
        
    }
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *ID = @"cellID";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }

    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.font = sysFont(15);
    cell.textLabel.textColor = [UIColor colorWithHexString:@"#6d6d6d"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    
    if (indexPath.section == 0) {
        cell.textLabel.text = @"账号安全";
    }else{
        NSArray *arr = @[@"常用地址",@"常见问题",@"意见反馈",@"关于我们"];
        cell.textLabel.text = arr[indexPath.row];
        
    }
    _lastCellFrame = cell.frame;
    
    return cell;
    
}






@end
