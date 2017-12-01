//
//  LYQChoseCarZhaoView.h
//  quanzhouda
//
//  Created by pro on 2017/11/23.
//  Copyright © 2017年 pro. All rights reserved.
//

#import <UIKit/UIKit.h>

// 选择驾照行驶证的弹框

typedef NS_ENUM(NSUInteger, pictureType) {
    pictureTypeJiaZhao,
    pictureTypeXingShiZheng,
};

@interface LYQChoseCarZhaoView : UIView

+(void)showType:(pictureType)type;

@end
