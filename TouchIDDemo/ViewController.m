//
//  ViewController.m
//  TouchIDDemo
//
//  Created by 董徐维 on 16/8/31.
//  Copyright © 2016年 董徐维. All rights reserved.
//

#import "ViewController.h"
#import <LocalAuthentication/LocalAuthentication.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    LAContext *context = [LAContext new];
    
    context.localizedFallbackTitle = @"密码登陆";
    
    NSError *error = nil;
    if ([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error])
    {
        NSLog(@"支持指纹识别");
        [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:@"请按home键指纹解锁" reply:^(BOOL success, NSError * _Nullable error)
         {
             if (success) {
                 NSLog(@"验证成功 刷新主界面");
                 dispatch_async(dispatch_get_main_queue(), ^{
                     UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:@"验证成功" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
                     [alertView show];
                 });
             }else{
                 NSLog(@"%@",error.localizedDescription);
                 switch (error.code) {
                     case LAErrorSystemCancel:
                     {
                         NSLog(@"系统取消授权，如其他APP切入");
                         break;
                     }
                     case LAErrorUserCancel:
                     {
                         NSLog(@"用户取消验证Touch ID");
                         break;
                     }
                     case LAErrorAuthenticationFailed:
                     {
                         NSLog(@"验证失败");
                         dispatch_async(dispatch_get_main_queue(), ^{
                             UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:@"验证失败" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
                             [alertView show];
                         });
                         break;
                     }
                     case LAErrorPasscodeNotSet:
                     {
                         NSLog(@"系统未设置密码");
                         break;
                     }
                     case LAErrorTouchIDNotAvailable:
                     {
                         NSLog(@"设备Touch ID不可用，例如未打开");
                         break;
                     }
                     case LAErrorTouchIDNotEnrolled:
                     {
                         NSLog(@"设备Touch ID不可用，用户未录入");
                         break;
                     }
                     case LAErrorUserFallback:
                     {
                         [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                             NSLog(@"用户选择输入密码，切换主线程处理");
                         }];
                         break;
                     }
                     default:
                     {
                         [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                             NSLog(@"其他情况，切换主线程处理");
                         }];
                         break;
                     }
                 }
             }
         }];
    }else{
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:@"您的不支持指纹识别" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
            [alertView show];
        switch (error.code) {
            case LAErrorTouchIDNotEnrolled:
            {
                NSLog(@"TouchID is not enrolled");
                break;
            }
            case LAErrorPasscodeNotSet:
            {
                NSLog(@"A passcode has not been set");
                break;
            }
            default:
            {
                NSLog(@"TouchID not available");
                break;
            }
        }
        
        NSLog(@"%@",error.localizedDescription);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
