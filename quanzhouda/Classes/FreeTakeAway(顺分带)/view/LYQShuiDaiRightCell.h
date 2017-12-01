//
//  LYQShuiDaiRightCell.h
//  quanzhouda
//
//  Created by pro on 2017/11/28.
//  Copyright © 2017年 pro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LYQShuiDaiViewModel.h"

@interface LYQShuiDaiRightCell : UITableViewCell
@property (nonatomic ,strong) LYQShuiDaiViewModel *model;

+(LYQShuiDaiRightCell *)ShuiDaiRightCellWithTab:(UITableView *)tab;

@end
