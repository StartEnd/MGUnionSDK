//
//  MGApi.h
//  MGUnionSDK
//
//  Created by Mr.Song on 2020/4/7.
//  Copyright © 2020 StartEnd. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol MGUnionSDKDelegate;


/// 支付错误
typedef NS_ENUM (NSInteger,MGPayErrCode) {
    MGSDKPay_Err_Ok = 0,                //Pay成功
    MGSDKPay_Err_OrderErr = -1,         //获取订单失败
    MGSDKPay_Err_ProductErr = -2,       //获取产品失败
    MGSDKPay_Err_PaymentErr = -3,       //支付失败
    MGSDKPay_Err_VerifyErr = -4         //校验订单失败
};

typedef void (^MGPaymentBlock)(NSString *orderNum,NSString *cpext, MGPayErrCode error);


typedef NS_ENUM (NSInteger,MGAuthErrCode) {
    MGSDKAuth_Err_Ok = 0,               //Auth成功
    MGSDKAuth_Err_NormalErr = -1,       //普通错误
    MGSDKAuth_Err_NetworkErr = -2,      //网络错误
};


@interface MGApi : NSObject


/**
注册SDK

@param appid                    游戏的appid
@parame weiboAppid              微博appid
@parame wechatAppid             微信appid
@parame wechatUniversalLink     微信universalLink
@param delegate                 SDK代理(推荐用AppDelegate)
*/
+ (void)registerApp:(NSString *)appid weiboApp:(NSString *)weiboAppid wechatAppid:(NSString *)wechatAppid wechatUniversalLink:(NSString *)wechatUniversalLink  delegate:(id<MGUnionSDKDelegate>)delegate;

/// 登陆
+ (void)login;

/// 用户信息界面,未登录用户会弹出绑定窗口
+ (void)userCenter;


/**
 支付
 
 @param productid       下单的产品id
 @param price           产品价格,单位分,字符串形式传递
 @param cpext           透传参数,游戏订单校验用
 @param paymentBlock    支付回调

 */
+ (void)paymentWithProductid:(NSString *)productid
                       price:(NSString *)price
                        cpext:(NSString *)cpext
                    callback:(MGPaymentBlock)paymentBlock;


/// 打开调试模式
+ (void)enableDebugMode:(BOOL)enabled;

/// 测试内部功能页面
+ (void) testInternalFunc;


/// 处理回调
+ (BOOL)handleOpenURL:(NSURL *)url;

/// 处理回调 新版微信适用
+ (BOOL)handleOpenUniversalLink:(NSUserActivity *)userActivity;

@end



@protocol MGUnionSDKDelegate

@required

/**
 账号退出(用户切换账号成功后调用)
 
 @param uid 退出账号的uid
 */
- (void)mg_logout:(NSString *)uid;

/**
 账号登录
 
 @param userInfo    用户信息
 @param err   错误信息
 */
- (void)mg_login:(NSDictionary *)userInfo error:(MGAuthErrCode )err;

/**
 旧订单验证回调
 
 初次下单付款后因某些原因验证失败,后续中订单被验证通过

 @param orderid     订单标识
 */
- (void)mg_oldOrderVerficationSuccess:(NSString *)orderid;


/**
 退出游戏
 */
- (void)mg_exitGame;


@end

