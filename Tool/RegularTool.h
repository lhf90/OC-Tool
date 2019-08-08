//
//  RegularTool.h
//  ChinaBidding
//
//  Created by 木子 on 2019/8/8.
//  Copyright © 2019 木子. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RegularTool : NSObject

+ (BOOL)isEmail:(NSString *)email;
+ (BOOL)isPhoneNum:(NSString *)phone;
+ (BOOL)isTelephone:(NSString *)tel;
+ (BOOL)isIdCard:(NSString *)idCard;
+ (BOOL)isOrganizationCode:(NSString *)origanization;

@end

NS_ASSUME_NONNULL_END
