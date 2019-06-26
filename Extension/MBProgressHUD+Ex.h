//
//  MBProgressHUD+Ex.h
//  Platform
//
//  Created by 木子 on 2019/6/25.
//  Copyright © 2019 koki. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (Ex)

+ (instancetype)showHUDAddedTo:(UIView *)view title:(NSString *)title;
+ (instancetype)showHUDTextModeAddedTo:(UIView *)view title:(NSString *)title;
+ (instancetype)showHUDTextModeWithTitle:(NSString *)title;

@end

