//
//  LYQContentView.h
//  quanzhouda
//
//  Created by pro on 2017/11/21.
//  Copyright © 2017年 pro. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LYQContentView;
@protocol LYQContentViewDelegate <NSObject>
- (void)contentView:(LYQContentView *)contentView changeAddressLabelClick:(UILabel *)addressLabel;
- (void)contentView:(LYQContentView *)contentView goAddressLabelClick:(UILabel *)goAddressLabel;


@end



@interface LYQContentView : UIView

@property (nonatomic ,copy) NSString *address;

@property (nonatomic ,weak) id <LYQContentViewDelegate> delegate;

+(LYQContentView *)contentView;
@end
