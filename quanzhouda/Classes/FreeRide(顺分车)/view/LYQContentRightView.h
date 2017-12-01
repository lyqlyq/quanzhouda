//
//  LYQContentRightView.h
//  quanzhouda
//
//  Created by pro on 2017/11/22.
//  Copyright © 2017年 pro. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^tapBecomeCheZhuBlock)();

@interface LYQContentRightView : UIView

@property (nonatomic ,copy) tapBecomeCheZhuBlock block;

+(LYQContentRightView *)rightView;
@end
