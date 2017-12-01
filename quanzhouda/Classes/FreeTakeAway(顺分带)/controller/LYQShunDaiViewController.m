//
//  LYQShunDaiViewController.m
//  quanzhouda
//
//  Created by pro on 2017/11/13.
//  Copyright © 2017年 pro. All rights reserved.
//

#import "LYQShunDaiViewController.h"
#import "LYQTopVIew.h"
#import "LYQShuDaiTopView.h"

#import "LYQShuDaiCell.h"
#import "LYQShuiDaiModel.h"
#import "LYQShuiDaiRightCell.h"
#import "LYQShuiDaiViewModel.h"
#import "LYQShuiDaiFooterView.h"

#import "LYQChoseTimeView.h"

#import "LYQShunDaiWuTypeController.h"

@interface LYQShunDaiViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate,topViewDelegete>

@property (nonatomic ,strong) UITableView *tab;

@property (nonatomic ,strong) LYQShuiDaiModel *model;

@property (nonatomic ,strong) LYQTopVIew *topView;

@property (nonatomic ,strong) LYQShuDaiTopView *henaderRegiht;

@property (nonatomic ,strong) UITableView *tabRight;



@property (nonatomic ,strong) UIScrollView *sc;

@property (nonatomic ,strong) NSMutableArray *rigthModels;

@property (nonatomic ,assign) BOOL isChoseStartTime;



@end

@implementation LYQShunDaiViewController

- (void)viewDidLoad {
      [super viewDidLoad];

    self.isChoseStartTime = NO;
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.view.backgroundColor = [UIColor colorWithHexString:@"#f2f2f2"];
    LYQTopVIew *top = [LYQTopVIew topView];
    top.frame = CGRectMake(0, 0, screen_W, 41);
    top.oneText = @"顺风寄件";
    top.twoText = @"发布路线";
    top.inderView_W = 61;
    top.delegate = self;
    _topView = top;
    
    [self.view addSubview:top];
    
    LYQShuDaiTopView  *henader = [LYQShuDaiTopView xmg_viewFromXib];
    henader.frame = CGRectMake(0, 0 , screen_W, 111);
  
    self.tab = [[UITableView alloc] initWithFrame:CGRectMake(0,0, screen_W, screen_H - CGRectGetMaxY(top.frame) - 15 - LYQNavMaxY - LYQTabBarH)];
    
    self.tab.dataSource = self;
    self.tab.delegate = self;
    self.tab.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tab.tableHeaderView = henader;
    
    
    
    self.sc = [[UIScrollView alloc]initWithFrame:CGRectMake(0,  CGRectGetMaxY(top.frame) + 15 , [UIScreen mainScreen].bounds.size.width, self.tab.xmg_height)];

    self.sc.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width * 2, 0);
    self.sc.pagingEnabled = YES;
    self.sc.bounces = NO;
    self.sc.delegate = self;
    self.sc.showsVerticalScrollIndicator = NO;
    self.sc.showsHorizontalScrollIndicator =NO;
    
    self.henaderRegiht = [LYQShuDaiTopView xmg_viewFromXib];
    henader.frame = CGRectMake(0, 0 , screen_W, 111);
    self.tabRight = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screen_W, self.tab.xmg_height)];
    self.tabRight.tableHeaderView = self.henaderRegiht;
    self.tabRight.delegate = self;
    self.tabRight.dataSource = self;
    UIView *contentRightView = [[UIView alloc] initWithFrame:CGRectMake(screen_W, 0, screen_W, self.tab.xmg_height)];
    self.tabRight.showsVerticalScrollIndicator = NO;
    [contentRightView addSubview:self.tabRight];
    [self.sc addSubview:contentRightView];
    
    self.tab.backgroundColor = [UIColor colorWithHexString:@"#f2f2f2"];
    self.tabRight.backgroundColor = self.tab.backgroundColor;
    LYQShuiDaiFooterView *footer = [LYQShuiDaiFooterView xmg_viewFromXib];
    footer.frame = CGRectMake(0, 0, screen_W, 300);
    self.tabRight.tableFooterView = footer;
  
    
    [self.sc addSubview:self.tab];
    [self.view addSubview:self.sc];
    

    

    self.rigthModels = [NSMutableArray array];

    for (NSInteger i = 0 ; i < 4; i ++) {
        LYQShuiDaiViewModel *model = [[LYQShuiDaiViewModel alloc] init];
        model.iconImageName = model.iconNames[i];
        model.nameStr = model.names[i];
        if (i == 2) {
            model.inderStr = @"请选择物品类型";
    
        }
        if (i == 3) {
            model.inderStr = @"5公斤以下";
       
        }
                model.isShowLeftImage = YES;
        [self.rigthModels addObject:model];
    }
    
    
    
}


-(void)topView:(LYQTopVIew *)view selectBtn:(UIButton *)seleBtn{
    
    CGFloat offset = (seleBtn.tag - 500) * [UIScreen mainScreen].bounds.size.width;
    [UIView animateWithDuration:0.2 animations:^{
        self.sc.contentOffset = CGPointMake(offset, 0);
    }];
    
    
}

-(void)dealloc{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}


-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    
    [self.view endEditing:YES];
    
    if (self.sc == scrollView) {
        self.topView.inderView_X = scrollView.contentOffset.x;
    }
    
    
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (self.tab == tableView) {
         return 3;
    }
    else{
        
        return self.rigthModels.count;
    }
   
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
 
    
    if (tableView == self.tabRight) {
        LYQShuiDaiRightCell *cell = [LYQShuiDaiRightCell ShuiDaiRightCellWithTab:tableView];
        
        cell.model = self.rigthModels[indexPath.row];
        
        return cell;
        
    }else{
        static NSString *ID = @"daiCell";
        
        self.model = [[LYQShuiDaiModel alloc] init];
        
        LYQShuDaiCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
        
        if (cell == nil) {
            cell = [LYQShuDaiCell xmg_viewFromXib];
        }
        if (indexPath.row == 0) {
        }
        if (indexPath.row == 1) {
            self.model = [[LYQShuiDaiModel alloc] init];
            
            self.model.infos = @[@"90寸香包一个",@"重100斤",@"重1111",@"重22222222"];
            self.model.remarks = @"不带赃物不带赃物不带赃物不带赃物不带赃物不带赃物不带赃物不带赃物不带赃物";
        }
        if (indexPath.row == 2) {
            self.model.infos = @[@"90寸香包一个",@"重100斤"];
            self.model.remarks = @"不带赃物不带赃物不带赃物不带赃物";
        }
        cell.model = self.model;
        
       
        return cell;
    }
}


- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    if (tableView == self.tabRight) {
        return 10.0f;
    }
    
    return 0.0f;
    
}

-(CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (self.tab == tableView) {
        
        return self.model.cellHeight;
    }
    else{
        
        return 41.0f;
    }

    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    __weak typeof(self) weakSlef = self;
    if (tableView == self.tabRight) {
        if (indexPath.row == 0) {
            [LYQChoseTimeView showTitle:nil data:nil].sureBtnClick = ^(NSString *choseTime,NSString *date){
                
                weakSlef.isChoseStartTime = YES;
               LYQShuiDaiViewModel *model =    [weakSlef.rigthModels firstObject];
                model.inderStr =  choseTime;
                NSIndexPath *path = [NSIndexPath indexPathForRow:0 inSection:0];
                [weakSlef.tabRight reloadRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationNone];
            };
        }
        
        if (indexPath.row == 1) {
            
            if (!weakSlef.isChoseStartTime) {
                [LYQHudView showInfo:@"请先选择出发时间"];
            }else{
                [LYQChoseTimeView showTitle:@"到达时间" data:nil].sureBtnClick = ^(NSString *choseTime,NSString *date){
                    LYQShuiDaiViewModel *model = weakSlef.rigthModels[1];
                    model.inderStr =  choseTime;
                    NSIndexPath *path = [NSIndexPath indexPathForRow:1 inSection:0];
                    [weakSlef.tabRight reloadRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationNone];
                };
                
            }
            
          
        }
        // 选择物品类型
        if (indexPath.row == 2) {
            LYQShunDaiWuTypeController *wuVC = [[LYQShunDaiWuTypeController alloc] init];
            wuVC.title = @"选择商品类型";
            wuVC.block= ^(NSString *type,NSMutableArray *types){
                 LYQShuiDaiViewModel *model = weakSlef.rigthModels[2];
                model.inderStr = type;
                model.types = types;
                NSIndexPath *path = [NSIndexPath indexPathForRow:2 inSection:0];
                [weakSlef.tabRight reloadRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationNone];
            };
            [self.navigationController pushViewController:wuVC animated:YES];
        }
        // 选择载重
        if (indexPath.row == 3) {
            
        }
        
        
    }
    
}



@end
