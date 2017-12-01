//
//  LYQChoseTimeView.m
//  quanzhouda
//
//  Created by pro on 2017/11/28.
//  Copyright © 2017年 pro. All rights reserved.
//

#import "LYQChoseTimeView.h"

#import "LYQTimeTool.h"

@interface LYQChoseTimeView ()<UIPickerViewDelegate,UIPickerViewDataSource>
@property (nonatomic ,strong) NSMutableArray *days;
@property (nonatomic ,strong) NSMutableArray *hours;
@property (nonatomic ,strong) NSMutableArray *mins;

@property (nonatomic ,strong) NSDate *todayData;
@property (nonatomic ,strong) NSDate *mingTianData;
@property (nonatomic ,strong) NSDate *houTaiData;

@property (nonatomic ,strong) NSMutableArray *data;



@end

@implementation LYQChoseTimeView


-(void)awakeFromNib{
    [super awakeFromNib];
  
    
    // 初始化View
    [self setUpView];
    
    [self setUpPickerData];
  
    
    [self pickerView:self.pickerView didSelectRow:0 inComponent:0];
    
   
}
-(void)setUpView{
    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.0];
    
    _contentView = self.allView;
    
    self.pickerView.delegate = self;
    self.pickerView.dataSource = self;
    
    [self.sureBtn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.cancleBtn addTarget:self action:@selector(cancleClick) forControlEvents:UIControlEventTouchUpInside];
    
    
}
-(void)setUpPickerData{
    self.days = [LYQTimeTool getAllDays];
    self.hours = [LYQTimeTool getAllHours];
    self.mins = [LYQTimeTool getMins];
}

static LYQChoseTimeView *_timeView;
static UIView  *_contentView ;
+(LYQChoseTimeView *)showTitle:(NSString *)title data:(NSMutableArray *)data{
    
    if (_timeView == nil) {
        _timeView = [LYQChoseTimeView xmg_viewFromXib];
    }

    _timeView.data = data;
    _timeView.frame = CGRectMake(0, 0, screen_W, screen_H);
    CGFloat content_H = 249;
    _contentView.transform = CGAffineTransformMakeTranslation(0, content_H);

    [UIView animateWithDuration:0.3 animations:^{
        _timeView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];

        _contentView.transform = CGAffineTransformIdentity;
    }];
    if (title == nil) {
    }else{
        _timeView.titleLabel.text = title;
    }
    [[UIApplication sharedApplication].keyWindow addSubview:_timeView];
    
    [_timeView.pickerView reloadAllComponents];
    
    return _timeView;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [LYQChoseTimeView dissmiss];
    
}

+(void)dissmiss{
    CGFloat content_H = 249;
    [UIView animateWithDuration:0.3 animations:^{
        _contentView.transform = CGAffineTransformMakeTranslation(0, content_H);
        _timeView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.0];

    } completion:^(BOOL finished) {
         [_timeView removeFromSuperview];
    }];
   
}


#pragma mark -----------------datapicker-----delegate----------------
// 多少列
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    if (_timeView.data == nil) {
          return 3;
    }else{
        
          return 1;
    }
    
  
}
//  多少行
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    
    if (_timeView.data == nil) {
        if (component == 0) {
            return self.days.count;
        }
        if (component == 1) {
            return self.hours.count;
        }
        return self.mins.count;
    }else{
        
        return _timeView.data.count;
    }
    
   
    
}
//  第component列第row行显示什么文字
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
  
    
    if (_timeView.data == nil) {
       
        
        if (component == 0) {
            return self.days[row];
        } if (component == 1) {
            return self.hours[row];
        }
        return self.mins[row];
        
    }else
    {
         return _timeView.data[row];
        
    }
    
    
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    NSLog(@"%ld --- row",row);
    NSLog(@"%ld --- component",component);
    
    
    if (_timeView.data == nil) {
        
        // 拖第一行
        if (component == 0) {
            if (row == 0) {
                
                // 选中今天
                if (self.hours.count == 24 ) {
                    self.hours = [LYQTimeTool getCurrentAfterHours];
                }
                [self pickerView:pickerView didSelectRow:0 inComponent:1];
            }else{
                // 选中不是今天
                self.hours = [LYQTimeTool getAllHours];
                self.mins = [LYQTimeTool getMins];
                
            }
            [self.pickerView reloadComponent:1];
            [self.pickerView reloadComponent:2];
            
            
            
        }
        // 拖第二行
        if (component == 1) {
            
            
            NSLog(@"%ld",row);
            
            NSInteger myTwoRow = [self.pickerView selectedRowInComponent:1]; // 当前小时
            NSInteger myOneRow = [self.pickerView selectedRowInComponent:0]; // 今天
            
            if (myTwoRow == 0 && row == 0 && myOneRow == 0) {
                // 选中今天当前小时  ---> 改变分钟
                
                NSLog(@" [self.pickerView selectedRowInComponent:1]; ----  %ld", [self.pickerView selectedRowInComponent:1]);
                
                
                if (self.mins.count == 12) {
                    self.mins = [LYQTimeTool getCurrentAfterMins];
                    [self pickerView:pickerView didSelectRow:0 inComponent:2];
                    
                    
                    
                }
            }else{
                self.mins = [LYQTimeTool getMins];
            }
            [self.pickerView reloadComponent:2];
        }
        // 拖第三行
        if (component == 2) {
        }
    }else{
        
        
    }
    


    
}



-(void)btnClick{
    
    
    
    if (_timeView.data == nil) {
        [LYQChoseTimeView dissmiss];
        NSInteger row1 =  [self.pickerView selectedRowInComponent:0];
        NSInteger row2 =  [self.pickerView selectedRowInComponent:1];
        NSInteger row3 = [self.pickerView selectedRowInComponent:2];
        NSString *timeStr = nil;
        NSString *date    = nil;
        if (self.mins.count > 0  && self.hours.count > 0 && self.days.count > 0 ) {
            timeStr = [NSString stringWithFormat:@"%@ %@ %@",self.days[row1],self.hours[row2],self.mins[row3]];
              date = [LYQTimeTool getDataString:self.days[row1] hours:self.hours[row2] min:self.mins[row3]];
        }

        if (self.sureBtnClick) {
            self.sureBtnClick(timeStr,date);
        }
    }else{
           [LYQChoseTimeView dissmiss];
          NSInteger row1 =  [self.pickerView selectedRowInComponent:0];
        
         NSString *countStr = _timeView.data[row1];
        
        if (self.sureBtnClick) {
            self.sureBtnClick(countStr,nil);
        }
        
    }
    
    

    
}
-(void)cancleClick{
    
    [LYQChoseTimeView dissmiss];
    
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    UILabel* pickerLabel = (UILabel*)view;
    if (!pickerLabel){
        pickerLabel = [[UILabel alloc] init];
        pickerLabel.adjustsFontSizeToFitWidth = YES;
        [pickerLabel setTextAlignment:NSTextAlignmentCenter];
        [pickerLabel setBackgroundColor:[UIColor clearColor]];
        [pickerLabel setFont:[UIFont systemFontOfSize:15]];
    }
    // Fill the label text here
    pickerLabel.text=[self pickerView:pickerView titleForRow:row forComponent:component];
    return pickerLabel;
}


@end
