//
//  LYQShunDaiWuTypeController.h
//  quanzhouda
//
//  Created by pro on 2017/11/28.
//  Copyright © 2017年 pro. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^chosTypeBlock)(NSString *type,NSMutableArray *types);

@interface LYQShunDaiWuTypeController : UIViewController

@property (nonatomic ,copy) chosTypeBlock block;

@end
