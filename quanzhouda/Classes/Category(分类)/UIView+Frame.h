//
//  UIView+Frame.h
//  quanzhouda
//
//  Created by pro on 2017/11/15.
//  Copyright © 2017年 pro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Frame)
@property CGFloat xmg_width;
@property CGFloat xmg_height;
@property CGFloat xmg_x;
@property CGFloat xmg_y;
@property CGFloat xmg_centerX;
@property CGFloat xmg_centerY;

+ (instancetype)xmg_viewFromXib;

-(void)drawGrayLine;
-(void)drawGrayLineRadius;


-(void)drawLine:(UIColor *)color;

@end
