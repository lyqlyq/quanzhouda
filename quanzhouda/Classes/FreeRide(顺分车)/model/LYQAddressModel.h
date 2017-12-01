//
//  LYQAddressModel.h
//  quanzhouda
//
//  Created by pro on 2017/11/29.
//  Copyright © 2017年 pro. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LYQLocaModel;

@interface LYQAddressModel : NSObject<NSCopying>
@property (nonatomic ,copy) NSString *adcode;
@property (nonatomic ,copy) NSString *address;
@property (nonatomic ,copy) NSString *district;
@property (nonatomic ,strong) LYQLocaModel *location;
@property (nonatomic ,copy) NSString *name;

@property (nonatomic ,copy) NSString *typecode;
@property (nonatomic ,copy) NSString *uid;

@end
