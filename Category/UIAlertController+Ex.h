//
//  UIAlertController+Ex.h
//  ChinaBidding
//
//  Created by 木子 on 2019/8/8.
//  Copyright © 2019 木子. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIAlertController (Ex)

/**
 只有一个Title的极简提示
 @param title title
 @param presentController presentController
 */
+ (void)showAlertWithTitle:(NSString *)title
         presentController:(UIViewController *)presentController;
/**
 简单的Alert提示  自定义buttonTitle
 
 @param title title
 @param message message
 @param buttonTitle buttonTitle
 @param presentController presentController
 */
+ (void)showAlertWithTitle:(NSString *)title
                   message:(NSString *)message
               buttonTitle:(NSString *)buttonTitle
         presentController:(UIViewController *)presentController;


/**
 简单的Alert提示  自定义button事件
 
 @param title title
 @param message message
 @param buttonTitle buttonTitle
 @param buttonAction buttonAction
 @param presentController presentController
 */
+ (void)showAlertWithTitle:(NSString *)title
                   message:(NSString *)message
               buttonTitle:(NSString *)buttonTitle
              buttonAction:(void(^)(UIAlertAction *action))buttonAction
         presentController:(UIViewController *)presentController;


/**
 两个按钮的Alert提示 一个为取消
 
 @param title title
 @param message message
 @param defaultTitle defaultTitle
 @param defaultAction defaultAction
 @param presentController presentController
 */
+ (void)showAlertWithTitle:(NSString *)title
                   message:(NSString *)message
              defaultTitle:(NSString *)defaultTitle
             defaultAction:(void(^)(UIAlertAction *action))defaultAction
         presentController:(UIViewController *)presentController;


/**
 两个按钮的Alert提示 均支持自定义事件
 
 @param title title
 @param message message
 @param cancelTitle cancelTitle
 @param defaultTitle defaultTitle
 @param cancelAction cancelAction
 @param defaultAction defaultAction
 @param presentController presentController
 */
+ (void)showAlertWithTitle:(NSString *)title
                   message:(NSString *)message
               cancelTitle:(NSString *)cancelTitle
              defaultTitle:(NSString *)defaultTitle
              cancelAction:(void(^)(UIAlertAction *action))cancelAction
             defaultAction:(void(^)(UIAlertAction *action))defaultAction
         presentController:(UIViewController *)presentController;


@end

NS_ASSUME_NONNULL_END
