//
//  LYQShowUserMapController.h
//  quanzhouda
//
//  Created by pro on 2017/11/23.
//  Copyright © 2017年 pro. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LYQUserLocationModel;

typedef void(^addressBlock)(LYQUserLocationModel *model);

@interface LYQShowUserMapController : UIViewController


@property (nonatomic ,copy) addressBlock block;


@end
