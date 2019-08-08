
//
//  UIAlertController+Ex.m
//  ChinaBidding
//
//  Created by 木子 on 2019/8/8.
//  Copyright © 2019 木子. All rights reserved.
//

#import "UIAlertController+Ex.h"

@implementation UIAlertController (Ex)

+ (void)showAlertWithTitle:(NSString *)title
         presentController:(UIViewController *)presentController
{
    [[self class] showAlertWithTitle:title message:nil cancelTitle:@"确定" defaultTitle:nil cancelAction:nil defaultAction:nil presentController:presentController];
}

//简单的Alert提示  自定义buttonTitle
+ (void)showAlertWithTitle:(NSString *)title
                   message:(NSString *)message
               buttonTitle:(NSString *)buttonTitle
         presentController:(UIViewController *)presentController
{
    
    [[self class] showAlertWithTitle:title message:message cancelTitle:buttonTitle defaultTitle:nil cancelAction:nil defaultAction:nil presentController:presentController];
}

//简单的Alert提示  自定义button事件
+ (void)showAlertWithTitle:(NSString *)title
                   message:(NSString *)message
               buttonTitle:(NSString *)buttonTitle
              buttonAction:(void (^)(UIAlertAction *))buttonAction
         presentController:(UIViewController *)presentController
{
    
    [[self class] showAlertWithTitle:title message:message cancelTitle:buttonTitle defaultTitle:nil cancelAction:buttonAction defaultAction:nil presentController:presentController];
}

//两个按钮的Alert提示 一个为取消
+ (void)showAlertWithTitle:(NSString *)title
                   message:(NSString *)message
              defaultTitle:(NSString *)defaultTitle
             defaultAction:(void (^)(UIAlertAction *))defaultAction
         presentController:(UIViewController *)presentController{
    
    [[self class] showAlertWithTitle:title message:message cancelTitle:@"取消" defaultTitle:defaultTitle cancelAction:nil defaultAction:defaultAction presentController:presentController];
}

//两个按钮的Alert提示 均支持自定义事件
+ (void)showAlertWithTitle:(NSString *)title
                   message:(NSString *)message
               cancelTitle:(NSString *)cancelTitle
              defaultTitle:(NSString *)defaultTitle
              cancelAction:(void (^)(UIAlertAction *))cancelAction
             defaultAction:(void (^)(UIAlertAction *))defaultAction
         presentController:(UIViewController *)presentController
{
    //    title = (title == nil ? @"" : title);
    //    message = (message == nil ? @"" : message);
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    if (cancelTitle) {
        
        [alertController addAction:[UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
            if (cancelAction) {
                cancelAction(action);
            }
        }]];
    }
    if (defaultTitle) {
        
        [alertController addAction:[UIAlertAction actionWithTitle:defaultTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            if (defaultAction) {
                defaultAction(action);
            }
        }]];
    }
    [presentController presentViewController:alertController animated:YES completion:nil];
}


@end
