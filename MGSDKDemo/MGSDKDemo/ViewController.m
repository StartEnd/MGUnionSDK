//
//  ViewController.m
//  MGSDKDemo
//
//  Created by Mr.Song on 2020/5/21.
//  Copyright © 2020 Mr.Song. All rights reserved.
//

#import "ViewController.h"
#import <MGUnionSDK/MGApi.h>


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)login:(id)sender {
    [MGApi login];
    
}
- (IBAction)personCenter:(id)sender {
    [MGApi userCenter];
    
}
- (IBAction)payment6:(id)sender {
    [MGApi paymentWithProductid:@"Evaoverseas001" price:@"600" cpext:@"cpex_600" callback:^(NSString *orderNum, NSString *cpext, MGPayErrCode error) {
           if(error == MGSDKPay_Err_Ok) {
             // 支付成功
           }else {
            //  支付失败
           }
       }];
}
- (IBAction)payment50:(id)sender {
    [MGApi paymentWithProductid:@"Evaoverseas003" price:@"5000" cpext:@"cpex50" callback:^(NSString *orderNum, NSString *cpext, MGPayErrCode error) {
        if(error == MGSDKPay_Err_Ok) {
          //  [self wg_showSuccessText:@"支付成功"];
        }else {
         //   [self wg_showErrorText:@"支付失败"];
        }
    }];
}
- (IBAction)payment168:(id)sender {
    [MGApi paymentWithProductid:@"Evaoverseas005" price:@"168000" cpext:@"cpex168" callback:^(NSString *orderNum, NSString *cpext, MGPayErrCode error) {
        if(error == MGSDKPay_Err_Ok) {
          //  [self wg_showSuccessText:@"支付成功"];
        }else {
         //   [self wg_showErrorText:@"支付失败"];
        }
    }];
}


@end
