
//
//  RegularTool.m
//  ChinaBidding
//
//  Created by 木子 on 2019/8/8.
//  Copyright © 2019 木子. All rights reserved.
//

#import "RegularTool.h"

@implementation RegularTool

+ (BOOL)isEmail:(NSString *)email {
    NSString *regex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@" , regex];
    return [pre evaluateWithObject:email];
}

+ (BOOL)isTelephone:(NSString *)tel {
    NSString *regex = @"^((\\d{3,4})|\\d{3,4}-|\\s)?\\d{7,14}$";
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@" , regex];
    return [pre evaluateWithObject:tel];
}

+ (BOOL)isPhoneNum:(NSString *)phone {
    NSString *regex = @"^1[0-9]{10}$";
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@" , regex];
    return [pre evaluateWithObject:phone];
}

+ (BOOL)isIdCard:(NSString *)idCard {
    NSString *regex = @"(^\\d{15}$)|(^\\d{18}$)|(^\\d{17}(\\d|X|x)$)";
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@" , regex];
    return [pre evaluateWithObject:idCard];
}

+ (BOOL)isOrganizationCode:(NSString *)origanization {
    NSString *regex = @"[1-9A-GY]{1}[1239]{1}[1-5]{1}[0-9]{5}[0-9A-Z]{10}";
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@" , regex];
    return [pre evaluateWithObject:origanization];
}

@end
