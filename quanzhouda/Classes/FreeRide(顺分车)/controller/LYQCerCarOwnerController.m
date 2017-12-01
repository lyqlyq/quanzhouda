//
//  LYQCerCarOwnerController.m
//  quanzhouda
//
//  Created by pro on 2017/11/23.
//  Copyright © 2017年 pro. All rights reserved.
//

#import "LYQCerCarOwnerController.h"

#import "LYQChoseCarZhaoView.h"

#import "LYQSureAndCancleView.h"

#import<AVFoundation/AVFoundation.h>
#import <Photos/Photos.h>
#import <AipOcrSdk/AipOcrSdk.h>
#import "LYQHUD.h"
#import "LYQUploadImageTool.h"

#pragma mark -----------------  行驶证---------------------

/*
 
 "住址" =         {
 words = "成都市青羊区清江东路16B号1药1单元501号";
 };
 "使用性质" =         {
 words = "非营运";
 };
 "发动机号码" =         {
 words = 1GRB405903;
 };
 "发证日期" =         {
 words = 20170728;
 };
 "号牌号码" =         {
 words = "川AA0X77";
 };
 "品牌型号" =         {
 words = "陆巡洋舰JMCU09J";
 };
 "所有人" =         {
 words = "孙凌亚";
 };
 "注册日期" =         {
 words = 20170728;
 };
 "车辆类型" =         {
 words = "小型越野客车";
 };
 "车辆识别代号" =         {
 words = JTMCJ09J5H4135959;
 };
 };
 "words_result_num" = 10;
 */
#pragma mark -----------------驾照---------------------
/*
 "log_id" = 7736374193244673934;
 "words_result" =     {
 "住址" =         {
 words = "西藏自治区拉萨市城关区娘热路67号";
 };
 "准驾车型" =         {
 words = C1;
 };
 "出生日期" =         {
 words = 19920820;
 };
 "初次领证日期" =         {
 words = 20140529;
 };
 "国籍" =         {
 words = "中国";
 };
 "姓名" =         {
 words = "";
 };
 "性别" =         {
 words = "男";
 };
 "有效期限" =         {
 words = 20140529;
 };
 "至" =         {
 words = 20200529;
 };
 "证号" =         {
 words = 513231199208201311;
 };
 };
 "words_result_num" = 10;
 */



@interface LYQCerCarOwnerController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIButton *DrivingLicenseBtn;
@property (weak, nonatomic) IBOutlet UIButton *xingshiZhengBtn;

@property (nonatomic ,strong) UIImagePickerController *imagePickerController;

@property (nonatomic ,assign) BOOL isDrivingLicensseClick;

// 姓名
@property (weak, nonatomic) IBOutlet UITextField *nameLabel;
// 车型
@property (weak, nonatomic) IBOutlet UITextField *carType;

#define carTypeKey @"车辆类型"
// 车颜色
@property (weak, nonatomic) IBOutlet UITextField *carColor;
// 车牌号
@property (weak, nonatomic) IBOutlet UITextField *carNumber;
#define carNumberKey @"号牌号码"

@end

@implementation LYQCerCarOwnerController

- (void)viewDidLoad {
    [super viewDidLoad];


    
    static NSString *postName = @"commintBtnClickPostName";

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(postPictureBtnClick) name:postName object:nil];
    
     _imagePickerController = [[UIImagePickerController alloc] init];
    _imagePickerController.delegate = self;
    _imagePickerController.allowsEditing = YES;
    
}

-(void)postPictureBtnClick{
    
  
    LYQSureAndCancleView *sureView  =  [LYQSureAndCancleView sureAndCancleView];
    sureView.sureBtnText = @"相机";
    sureView.cancleBtnText = @"相册";
    sureView.sureBtnColor = [UIColor blackColor];
    
    
    __weak typeof(self) weakSelf = self;
    
    sureView.block = ^(NSString *str ){
      
        [LYQSureAndCancleView dissmiss];

        if ([weakSelf isChoseVideo]) {
            _imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
            [weakSelf presentViewController:_imagePickerController animated:YES completion:nil];
        }else{
            show(@"没有相机权限");
        }
  
    };
    
    sureView.cancleBlock = ^(NSString *str){
        
        if ([weakSelf isChosePicture]) {
            
            _imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            
            [weakSelf presentViewController:_imagePickerController animated:YES completion:nil];
        }
        else{
            show(@"没有相册权限");
        }
        
    };
    
    [sureView showView];
    
    
}

// 是否口选择照片
-(BOOL)isChosePicture{
    
    PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
    if (status == PHAuthorizationStatusRestricted ||
        status == PHAuthorizationStatusDenied) {
        return NO;
    }
    return YES;
}

// 是否可以选择相机
-(BOOL)isChoseVideo{
      AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    
    
    if (authStatus ==AVAuthorizationStatusRestricted ||//此应用程序没有被授权访问的照片数据。可能是家长控制权限
        authStatus ==AVAuthorizationStatusDenied)  //用户已经明确否认了这一照片数据的应用程序访问
    {
        return NO;
    }
    
    return YES;
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    UIImage *image  = info[UIImagePickerControllerOriginalImage];
     __weak typeof(self) weakSelf = self;
    if (self.isDrivingLicensseClick) {
         // 驾照
        [self.DrivingLicenseBtn setBackgroundImage:image forState:UIControlStateNormal];
        
        [LYQHUD showMessage:@"读取中..."];

        [[AipOcrService shardService] detectDrivingLicenseFromImage:image withOptions:nil successHandler:^(id result) {

            dispatch_async(dispatch_get_main_queue(), ^{
                [LYQHUD dissmiss];

               weakSelf.nameLabel.text = [weakSelf getInfoWithResp:result key:@"姓名"];
                NSLog(@"%@",result);

            });

        } failHandler:^(NSError *err) {

        }];
        
    }else{
        // 行驶证
        [self.xingshiZhengBtn setBackgroundImage:image forState:UIControlStateNormal];
        
        
        [LYQHUD showMessage:@"读取中..."];
     

        [[AipOcrService shardService] detectVehicleLicenseFromImage:image withOptions:nil successHandler:^(id result) {

            dispatch_async(dispatch_get_main_queue(), ^{
                [LYQHUD dissmiss];

                weakSelf.carNumber.text = [weakSelf getInfoWithResp:result key:carNumberKey];
                weakSelf.carType.text = [weakSelf getInfoWithResp:result key:carTypeKey];

                NSLog(@"%@",result);
            });


        } failHandler:^(NSError *err) {
            [LYQHUD dissmiss];


        }];

    }
    
}

-(NSString *)getInfoWithResp:(id)resp key:(NSString *)myKey{
    
     __block NSString *myObj = nil;

           if(resp[@"words_result"]){
               if([resp[@"words_result"] isKindOfClass:[NSDictionary class]]){
                   [resp[@"words_result"] enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
                       
                       if([obj isKindOfClass:[NSDictionary class]] && [obj objectForKey:@"words"]){
                        
                           if ([key isEqualToString:myKey]) {
                               if([obj[@"words"] isKindOfClass:[NSString class]]){
                                   myObj = obj[@"words"];
                                  
                               }
                           }
                       }}];
          
               }
        }

    return myObj;
    
}


- (IBAction)jiaZhaoClick:(id)sender {
    self.isDrivingLicensseClick = YES;
    [LYQChoseCarZhaoView showType:pictureTypeJiaZhao];
    
}
- (IBAction)xingShizhengClick:(id)sender {
    self.isDrivingLicensseClick = NO;
    [LYQChoseCarZhaoView showType:pictureTypeXingShiZheng];
}
-(void)dealloc{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}


@end
