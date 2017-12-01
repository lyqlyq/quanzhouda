//
//  AppDelegate.m
//  quanzhouda
//
//  Created by pro on 2017/11/14.
//  Copyright © 2017年 pro. All rights reserved.
//

#import "AppDelegate.h"

// af8b6d7276e53546986185e6892a57eb
#import <AMapFoundationKit/AMapFoundationKit.h>

#import <WXApi.h>
#import <TencentOpenAPI/TencentOAuth.h>
#import <TencentOpenAPI/QQApiInterface.h>

// 导航
#import <ShareSDK/ShareSDK.h>
#import <ShareSDKConnector/ShareSDKConnector.h>

// 定位
//#import <AMapFoundationKit/AMapFoundationKit.h>
//#import <AMapLocationKit/AMapLocationKit.h>


#import "LYQLoginRegController.h"
#import "LYQTabbarController.h"

#import <AipOcrSdk/AipOcrSdk.h>

#import "LYQChoseWindowTool.h"

@interface AppDelegate ()
// wxa963062d72a92503
@end

// dc483e80a7a0bd9ef71d8cf9736739

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    
    [LYQChoseWindowTool choseWindowWithWindow:self.window];
    
    
    // 阿里云地图
    [AMapServices sharedServices].apiKey = @"5c1b89258014f3001287ea0a3178e838";
    
  //   车辆照片识别（百度云）
    [[AipOcrService shardService] authWithAK:@"M0pvSD2YqbXQTGdGvyFKNG6B" andSK:@"BqzzOR5qkRsgTEtbMwFliiqLUyYlHCGu"];
    [AMapServices sharedServices].apiKey =@"5c1b89258014f3001287ea0a3178e838";

  
//
//    [ShareSDK registerActivePlatforms:@[@(SSDKPlatformTypeQQ),@(SSDKPlatformTypeWechat)] onImport:^(SSDKPlatformType platformType) {
//        switch (platformType) {
//            case SSDKPlatformTypeWechat:
//                [ShareSDKConnector connectWeChat:[WXApi class]];
//                break;
//
//            case SSDKPlatformTypeQQ:
//               [ShareSDKConnector connectQQ:[QQApiInterface class] tencentOAuthClass:[TencentOAuth class]];
//            default:
//                break;
//        }
//    } onConfiguration:^(SSDKPlatformType platformType, NSMutableDictionary *appInfo) {
//        switch (platformType) {
//            case SSDKPlatformTypeWechat:
//                [appInfo SSDKSetupWeChatByAppId:@"wxa963062d72a92503" appSecret:@"8191ee9425092d0a10d1f1308f5db8dd"];
//                break;
//            case SSDKPlatformTypeQQ:
//                [appInfo SSDKSetupQQByAppId:@"100371282"
//                                     appKey:@"aed9b0303e3ed1e27bae87c33761161d"
//                                   authType:SSDKAuthTypeBoth];
//                break;
//
//            default:
//                break;
//        }
//    }];
    


    
    [self.window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
