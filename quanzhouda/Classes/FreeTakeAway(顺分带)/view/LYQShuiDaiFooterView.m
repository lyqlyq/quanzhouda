//
//  LYQShuiDaiFooterView.m
//  quanzhouda
//
//  Created by pro on 2017/11/28.
//  Copyright © 2017年 pro. All rights reserved.
//

#import "LYQShuiDaiFooterView.h"

@interface LYQShuiDaiFooterView ()<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UIButton *pushBtn;
@property (weak, nonatomic) IBOutlet UITextView *reankstext;
@property (weak, nonatomic) IBOutlet UILabel *numLable;

@end;

@implementation LYQShuiDaiFooterView


-(void)awakeFromNib{
    [super awakeFromNib];
    
    self.pushBtn.layer.cornerRadius = 4;
    self.pushBtn.layer.masksToBounds = YES;
    
    [self.pushBtn addTarget:self action:@selector(pushBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    self.reankstext.delegate = self;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textViewDidChangeText:) name:UITextViewTextDidChangeNotification object:self.reankstext];
}

-(void)textViewDidChangeText:(NSNotification *)notification{
    
    static int kMaxLength = 40;
    UITextView *textView = (UITextView *)notification.object;
    
    NSString *toBeString = textView.text;
    // 获取键盘输入模式
    
    NSString *lang = [[UITextInputMode currentInputMode] primaryLanguage];
    
    // 中文输入的时候,可能有markedText(高亮选择的文字),需要判断这种状态
    
    // zh-Hans表示简体中文输入, 包括简体拼音，健体五笔，简体手写
    
    if ([lang isEqualToString:@"zh-Hans"]) {
        UITextRange *selectedRange = [textView markedTextRange];
        //获取高亮选择部分
        UITextPosition *position = [textView positionFromPosition:selectedRange.start offset:0];
        // 没有高亮选择的字，表明输入结束,则对已输入的文字进行字数统计和限制
        
        self.numLable.text = [NSString stringWithFormat:@"%d",kMaxLength - toBeString.intValue];
        
        if (!position) {
            if (toBeString.length > kMaxLength) {
                // 截取子串
                textView.text = [toBeString substringToIndex:kMaxLength];
                
            }
            
        } else { // 有高亮选择的字符串，则暂不对文字进行统计和限制
            
            NSLog(@"11111111111111========      %@",position);
            
        }
        
    } else {
        
        // 中文输入法以外的直接对其统计限制即可，不考虑其他语种情况
        
        if (toBeString.length > kMaxLength) {
            // 截取子串
            textView.text = [toBeString substringToIndex:kMaxLength];
            
        }
        
    }

}

-(void)pushBtnClick{
    
    NSLog(@"%@",@"pushBtnClick");
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
