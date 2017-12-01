//
//  LYQChoseTimeView.h
//  quanzhouda
//
//  Created by pro on 2017/11/28.
//  Copyright © 2017年 pro. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^sureBlock)(NSString *choseTime,NSString *date);

@interface LYQChoseTimeView : UIView
@property (weak, nonatomic) IBOutlet UIButton *cancleBtn;
@property (weak, nonatomic) IBOutlet UIButton *sureBtn;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (nonatomic ,copy) sureBlock sureBtnClick;
@property (weak, nonatomic) IBOutlet UIView *allView;

+(LYQChoseTimeView *)showTitle:(NSString *)title data:(NSMutableArray *)data;
+(void)dissmiss;

@end
