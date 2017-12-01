//
//  LYQAddressCell.h
//  quanzhouda
//
//  Created by pro on 2017/11/29.
//  Copyright © 2017年 pro. All rights reserved.
//

#import <UIKit/UIKit.h>


@class LYQAddressModel;
@interface LYQAddressCell : UITableViewCell

@property (nonatomic ,strong) LYQAddressModel *model;

+(LYQAddressCell *)addressCellWithTab:(UITableView *)tab;
@end
