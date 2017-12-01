//
//  LYQUser.h
//  quanzhouda
//
//  Created by pro on 2017/11/20.
//  Copyright © 2017年 pro. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LYQUser : NSObject <NSCoding>

/*
 info =     {
 address = "";
 audit = 0;
 avatar = "";
 "created_at" = "<null>";
 id = 64;
 "id_number" = "";
 money = 0;
 name = "";
 password = 44d35d1a8e9f7070de90bcd4d99ac035;
 phone = 18081032157;
 "remember_token" = "<null>";
 sex = "男";
 status = 1;
 type = 1;
 "updated_at" = "<null>";
 "user_del" = 1;
 };
 result = 0;
 text = "验证通过";
 */

@property (nonatomic ,copy) NSString *name;
@property (nonatomic ,copy) NSString *phone;


@property (nonatomic ,copy) NSString *address;
@property (nonatomic ,copy) NSString *audit;
@property (nonatomic ,copy) NSString *avatar;
@property (nonatomic ,copy) NSString *created_at;
//@property (nonatomic ,copy) NSString *id;
@property (nonatomic ,copy) NSString *id_number;
@property (nonatomic ,copy) NSString *money;

@property (nonatomic ,copy) NSString *remember_token;
@property (nonatomic ,copy) NSString *sex;
@property (nonatomic ,copy) NSString *status;
@property (nonatomic ,copy) NSString *type;
@property (nonatomic ,copy) NSString *user_del;
@property (nonatomic ,copy) NSString *updated_at;

@property (nonatomic ,copy) NSString *result;
@property (nonatomic ,copy) NSString *text;

@property (nonatomic ,copy) NSString *u_id;



@end
