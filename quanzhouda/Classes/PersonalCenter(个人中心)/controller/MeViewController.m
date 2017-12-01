//
//  MeViewController.m
//  quanzhouda
//
//  Created by pro on 2017/11/15.
//  Copyright © 2017年 pro. All rights reserved.
//

#import "MeViewController.h"
#import "LYQMeHeaderView.h"
#import "LYQMeModel.h"

#import "LYQMeCell.h"

#import "LYQSetUpViewController.h"

#define headerView_H  200

@interface MeViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic ,strong) UITableView *tab;

@property (nonatomic ,strong) LYQMeModel *model;


@property (nonatomic ,strong) LYQMeHeaderView *henderView;

@end

@implementation MeViewController

-(void)initData{
    
    self.model = [[LYQMeModel alloc] init];
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
//    [self.navigationController.navigationBar setHidden:YES];
    
    [self initData];
    
    self.tab = [[UITableView alloc] initWithFrame:CGRectMake(0, -20, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    
    LYQMeHeaderView *headerView = [LYQMeHeaderView xmg_viewFromXib];
    _henderView = headerView;
    headerView.xmg_height =  headerView_H;
    self.tab.tableHeaderView = headerView;

    
 
    
    
    self.tab.tableFooterView = [[UIView alloc] init];
    self.tab.delegate = self;
    self.tab.dataSource = self;
   
    
    [self.view addSubview:self.tab];
    
    
    
    
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
    
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.model.allModelArr.count;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 4) {
        LYQSetUpViewController *setUp = [[LYQSetUpViewController alloc] init];
        setUp.title = @"设置";
        [self.navigationController pushViewController:setUp animated:YES];
    }
    
}



- (UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    
    static NSString *cellID = @"cellID";
    
    LYQMeCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (cell == nil) {
        cell = [[LYQMeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    cell.model = self.model.allModelArr[indexPath.row];
    
    return cell;
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}
@end
