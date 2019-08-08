//
//  Permission.h
//  ChinaBidding
//
//  Created by 木子 on 2019/8/8.
//  Copyright © 2019 木子. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Permission : NSObject
/**
 相机权限
 */
+ (void)authorizeCameraCompletion:(void(^)(BOOL granted))completion;
/**
 相册权限
 */
+ (void)authorizePhotoCompletion:(void(^)(BOOL granted))completion;


@end

NS_ASSUME_NONNULL_END
