//
//  AppDelegate.m
//  MGSDKDemo
//
//  Created by Mr.Song on 2020/5/21.
//  Copyright © 2020 Mr.Song. All rights reserved.
//

#import "AppDelegate.h"
#import <MGUnionSDK/MGApi.h>

@interface AppDelegate ()<MGUnionSDKDelegate>

@end

@implementation AppDelegate

- (void)mg_logout:(NSString *)uid {
    // 用户退出
}

- (void)mg_login:(NSDictionary *)userInfo error:(MGAuthErrCode )err {
    if(err == MGSDKPay_Err_Ok) {
      // 登陆成功
    }
}

- (void)mg_oldOrderVerficationSuccess:(NSString *)orderid {
    // 旧订单校验通过
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [MGApi enableDebugMode:YES];
    [MGApi registerApp:@"1234567" weiboApp:@"3296205093" wechatAppid:@"wx5acbcc484fac2f1e" wechatUniversalLink:@"https://update.qp.games.weibo.com/apple-app-site-association/" delegate:self];
    return YES;
}


- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    return  [MGApi handleOpenURL:url];
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    return [MGApi handleOpenURL:url];
}


- (BOOL)application:(UIApplication *)application continueUserActivity:(NSUserActivity *)userActivity    restorationHandler:(void(^)(NSArray<id<UIUserActivityRestoring>> * __nullable restorableObjects))restorationHandler {
        return [MGApi handleOpenUniversalLink:userActivity];
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
