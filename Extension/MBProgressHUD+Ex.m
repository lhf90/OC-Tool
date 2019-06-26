//
//  MBProgressHUD+Ex.m
//  Platform
//
//  Created by 木子 on 2019/6/25.
//  Copyright © 2019 koki. All rights reserved.
//

#import "MBProgressHUD+Ex.h"

@implementation MBProgressHUD (Ex)

+ (instancetype)showHUDAddedTo:(UIView *)view title:(NSString *)title {
    MBProgressHUD *hud = [MBProgressHUD setupHUDTo:view];
    hud.label.text = title;
    hud.removeFromSuperViewOnHide = true;
    return hud;
}

+ (instancetype)showHUDTextModeAddedTo:(UIView *)view title:(NSString *)title {
    MBProgressHUD *hud = [MBProgressHUD setupHUDTo:view];
    hud.mode = MBProgressHUDModeText;
    hud.label.text = title;
    hud.removeFromSuperViewOnHide = true;
    [hud hideAnimated:true afterDelay:2];
    return hud;
}

+ (instancetype)showHUDTextModeWithTitle:(NSString *)title{
    
    MBProgressHUD *hud = [MBProgressHUD setupHUDTo:[UIApplication sharedApplication].keyWindow];
    hud.mode = MBProgressHUDModeText;
    hud.label.text = title;
    hud.removeFromSuperViewOnHide = true;
    [hud hideAnimated:true afterDelay:2];
    return hud;
}

+ (instancetype)setupHUDTo:(UIView *)view {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:true];
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.8];
    hud.contentColor = [UIColor whiteColor];
    return hud;
}

@end
