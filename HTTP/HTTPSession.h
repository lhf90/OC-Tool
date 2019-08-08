//
//  HTTPSession.h
//  ChinaBidding
//
//  Created by 木子 on 2019/8/8.
//  Copyright © 2019 木子. All rights reserved.
//

#import "AFHTTPSessionManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface HTTPSession : AFHTTPSessionManager

+ (instancetype)shared;

/**
 POST Method

 @param method method description
 @param parameters parameters description
 @param completion response description
 @return return value description
 */
- (nullable NSURLSessionDataTask *)post:(NSString *)method
                             parameters:(nullable id)parameters
                             completion:(nullable void(^)(BOOL success, NSString * _Nullable message, id _Nullable data) )completion;

/**
 POST Method With Controller

 @param method method description
 @param controller controller description
 @param parameters parameters description
 @param completion response description
 @return return value description
 */
- (nullable NSURLSessionDataTask *)post:(NSString *)method
                             controller:(NSString *)controller
                             parameters:(nullable id)parameters
                             completion:(nullable void(^)(BOOL success, NSString * _Nullable message, id _Nullable data) )completion;

/**
 UPLOAD Method

 @param method method description
 @param parameters parameters description
 @param block block description
 @param uploadProgress uploadProgress description
 @param completion completion description
 @return return value description
 */
- (nullable NSURLSessionDataTask *)upload:(NSString *)method
                               parameters:(nullable id)parameters
                constructingBodyWithBlock:(nullable void(^)(id <AFMultipartFormData> formData))block
                                 progress:(nullable void(^)(NSProgress *uploadProgress))uploadProgress
                               completion:(nullable void(^)(BOOL success, NSString * _Nullable message, id _Nullable data) )completion;


@end

NS_ASSUME_NONNULL_END
