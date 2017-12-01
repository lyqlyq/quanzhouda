//
//  LYQSureAndCancleView.h
//  quanzhouda
//
//  Created by pro on 2017/11/22.
//  Copyright © 2017年 pro. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^sureBlock)(NSString *str);
typedef void(^cancleBlock)(NSString *str);



@interface LYQSureAndCancleView : UIView

@property (nonatomic ,copy) sureBlock block;
@property (nonatomic ,copy) cancleBlock cancleBlock;




/**确定按钮的文字修改*/
@property (nonatomic ,copy) NSString *sureBtnText;

/**取消按钮的文字修改*/
@property (nonatomic ,copy) NSString *cancleBtnText;

/**确定按钮的文字颜色修改*/
@property (nonatomic ,strong) UIColor *sureBtnColor;

/**确定按钮的文字颜色修改*/
@property (nonatomic ,strong) UIColor *cancleBtnColor;


+(LYQSureAndCancleView *)show;
+(void)dissmiss;

+(LYQSureAndCancleView *)sureAndCancleView;

-(void)showView;
@end
