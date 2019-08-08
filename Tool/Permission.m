
//
//  Permission.m
//  ChinaBidding
//
//  Created by 木子 on 2019/8/8.
//  Copyright © 2019 木子. All rights reserved.
//

#import "Permission.h"
#import <Photos/Photos.h>
#import <AssetsLibrary/AssetsLibrary.h>

@implementation Permission

/**
 跳转系统设置
 */
+ (void)jumpToSystemSetting{
    
    NSURL *setting = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
    if (setting != nil) {
        
        if (@available(iOS 10.0, *)) {
            [[UIApplication sharedApplication] openURL:setting options:@{} completionHandler:nil];
        } else {
            [[UIApplication sharedApplication]openURL:setting];
        }
    }
}

+ (void)alertOpenSettingWithTitle:(NSString *)title message:(NSString *)message {
    
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    [alertVC addAction:[UIAlertAction actionWithTitle:@"前往设置" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        
        [Permission jumpToSystemSetting];
        
    }]];
    [alertVC addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    [[UIApplication sharedApplication].delegate.window.rootViewController presentViewController:alertVC animated:true completion:nil];
}

/*
**
相册权限
*/
+ (void)authorizePhotoCompletion:(void(^)(BOOL granted))completion {
    
    if (completion == nil) {
        return;
    }
    PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
    switch (status) {
        case PHAuthorizationStatusAuthorized:
            completion(true);
            break;
        case PHAuthorizationStatusRestricted:
        case PHAuthorizationStatusDenied:
            completion(false);
            [Permission alertOpenSettingWithTitle:@"无法查看照片" message:@"请在iPhone的\"设置-隐私-照片\"中允许访问照片"];
            break;
        default:
            [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    
                    BOOL status = PHAuthorizationStatusAuthorized ? true : false;
                    completion(status);
                    if (!status) {
                        [Permission alertOpenSettingWithTitle:@"无法查看照片" message:@"请在iPhone的\"设置-隐私-照片\"中允许访问照片"];
                    }
                });
            }];
            break;
    }
}

/**
 相机权限
 */
+ (void)authorizeCameraCompletion:(void(^)(BOOL granted))completion{
    
    if (completion == nil) {
        return;
    }
    AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    switch (status) {
        case AVAuthorizationStatusAuthorized:
            completion(true);
            break;
        case AVAuthorizationStatusRestricted:
        case AVAuthorizationStatusDenied:
            completion(false);
            [Permission alertOpenSettingWithTitle:@"无法使用相机" message:@"请在iPhone的\"设置-隐私-相机\"中允许访问相机"];
            break;
        default:
            [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    completion(granted);
                    if (!granted) {
                        [Permission alertOpenSettingWithTitle:@"无法使用相机" message:@"请在iPhone的\"设置-隐私-相机\"中允许访问相机"];
                    }
                });
            }];
            break;
    }
}


@end
