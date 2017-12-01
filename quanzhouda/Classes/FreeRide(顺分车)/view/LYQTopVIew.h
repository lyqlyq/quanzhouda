//
//  LYQTopVIew.h
//  quanzhouda
//
//  Created by pro on 2017/11/21.
//  Copyright © 2017年 pro. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LYQTopVIew;
@protocol topViewDelegete <NSObject>

@required
-(void)topView:(LYQTopVIew *)view selectBtn:(UIButton *)seleBtn;
@end


@interface LYQTopVIew : UIView

@property (nonatomic , weak) id <topViewDelegete> delegate;

// 控制滚动
@property (nonatomic ,assign) CGFloat  inderView_X ;

// 滚动条宽度
@property (nonatomic ,assign) CGFloat  inderView_W ;


@property (nonatomic ,copy) NSString *oneText;

@property (nonatomic ,copy) NSString *twoText;


+(LYQTopVIew *)topView;
@end
