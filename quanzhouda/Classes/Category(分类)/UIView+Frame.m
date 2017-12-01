//
//  UIView+Frame.m
//  quanzhouda
//
//  Created by pro on 2017/11/15.
//  Copyright © 2017年 pro. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)
+ (instancetype)xmg_viewFromXib
{
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil].firstObject;
}

- (void)setXmg_height:(CGFloat)xmg_height
{
    CGRect rect = self.frame;
    rect.size.height = xmg_height;
    self.frame = rect;
}

- (CGFloat)xmg_height
{
    return self.frame.size.height;
}

- (CGFloat)xmg_width
{
    return self.frame.size.width;
}
- (void)setXmg_width:(CGFloat)xmg_width
{
    CGRect rect = self.frame;
    rect.size.width = xmg_width;
    self.frame = rect;
}

- (CGFloat)xmg_x
{
    return self.frame.origin.x;
    
}

- (void)setXmg_x:(CGFloat)xmg_x
{
    CGRect rect = self.frame;
    rect.origin.x = xmg_x;
    self.frame = rect;
}

- (void)setXmg_y:(CGFloat)xmg_y
{
    CGRect rect = self.frame;
    rect.origin.y = xmg_y;
    self.frame = rect;
}

- (CGFloat)xmg_y
{
    
    return self.frame.origin.y;
}

- (void)setXmg_centerX:(CGFloat)xmg_centerX
{
    CGPoint center = self.center;
    center.x = xmg_centerX;
    self.center = center;
}

- (CGFloat)xmg_centerX
{
    return self.center.x;
}

- (void)setXmg_centerY:(CGFloat)xmg_centerY
{
    CGPoint center = self.center;
    center.y = xmg_centerY;
    self.center = center;
}

- (CGFloat)xmg_centerY
{
    return self.center.y;
}

-(void)drawGrayLineRadius{
    
    CAShapeLayer *borderLayer = [CAShapeLayer layer];
    borderLayer.bounds = CGRectMake(0, 0, self.xmg_width, self.xmg_height);
    borderLayer.position = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    //   borderLayer.position = self.layer.position;
    
    borderLayer.path = [UIBezierPath bezierPathWithRoundedRect:borderLayer.bounds cornerRadius:5].CGPath;
  
    borderLayer.lineWidth = 1. / [[UIScreen mainScreen] scale];
    //虚线边框
    borderLayer.lineDashPattern = @[@2, @2];
    //实线边框
    //    borderLayer.lineDashPattern = nil;
    borderLayer.fillColor = [UIColor clearColor].CGColor;
    borderLayer.strokeColor = [UIColor grayColor].CGColor;
    [self.layer addSublayer:borderLayer];
    
}

-(void)drawGrayLine{

    CAShapeLayer *borderLayer = [CAShapeLayer layer];
    borderLayer.bounds = CGRectMake(0, 0, self.xmg_width, self.xmg_height);
    borderLayer.position = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
 //   borderLayer.position = self.layer.position;
    
    borderLayer.path = [UIBezierPath bezierPathWithRoundedRect:borderLayer.bounds cornerRadius:CGRectGetWidth(borderLayer.bounds)].CGPath;

 
    
 
    
    borderLayer.lineWidth = 1. / [[UIScreen mainScreen] scale];
    //虚线边框
    borderLayer.lineDashPattern = @[@2, @2];
    //实线边框
    //    borderLayer.lineDashPattern = nil;
    borderLayer.fillColor = [UIColor clearColor].CGColor;
    borderLayer.strokeColor = [UIColor grayColor].CGColor;
    [self.layer addSublayer:borderLayer];
 
    
}

-(void)drawLine:(UIColor *)color{
    
    CAShapeLayer *borderLayer = [CAShapeLayer layer];
    borderLayer.bounds = CGRectMake(0, 0, self.xmg_width, self.xmg_height);
    borderLayer.position = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    //   borderLayer.position = self.layer.position;
    
    borderLayer.path = [UIBezierPath bezierPathWithRoundedRect:borderLayer.bounds cornerRadius:CGRectGetWidth(borderLayer.bounds)].CGPath;
    
    
    
    
    borderLayer.lineWidth = 1. / [[UIScreen mainScreen] scale];
    //虚线边框
    borderLayer.lineDashPattern = @[@2, @2];
    //实线边框
    //    borderLayer.lineDashPattern = nil;
    borderLayer.fillColor = [UIColor clearColor].CGColor;
    borderLayer.strokeColor =color.CGColor;
    [self.layer addSublayer:borderLayer];
}

@end
