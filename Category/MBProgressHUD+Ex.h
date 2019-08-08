//
//  MBProgressHUD+Ex.h
//  ChinaBidding
//
//  Created by 木子 on 2019/8/8.
//  Copyright © 2019 木子. All rights reserved.
//

#import "MBProgressHUD.h"

NS_ASSUME_NONNULL_BEGIN

@interface MBProgressHUD (Ex)

+ (instancetype)showHUDAddedTo:(UIView *)view title:(NSString *)title;
+ (instancetype)showHUDTextModeAddedTo:(UIView *)view title:(NSString *)title;
+ (instancetype)showHUDTextModeWithTitle:(NSString *)title;

@end

NS_ASSUME_NONNULL_END
