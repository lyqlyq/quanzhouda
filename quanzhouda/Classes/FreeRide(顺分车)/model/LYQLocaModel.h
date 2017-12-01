//
//  LYQLocaModel.h
//  quanzhouda
//
//  Created by pro on 2017/11/29.
//  Copyright © 2017年 pro. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LYQLocaModel : NSObject<NSCoding>

/**纬度*/
@property (nonatomic ,copy) NSString *latitude;
/**经度*/
@property (nonatomic ,copy) NSString *longitude;

@end
