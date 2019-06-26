//
//  HTTPSession.h
//  Platform
//
//  Created by 木子 on 2019/6/25.
//  Copyright © 2019 koki. All rights reserved.
//

#import "AFHTTPSessionManager.h"
#import "HTTPResponse.h"

typedef void(^Completion)(HTTPResponse * _Nonnull response);

@interface HTTPSession : AFHTTPSessionManager

+ (instancetype _Nonnull )shared;

- (nullable NSURLSessionDataTask *)post:(NSString *_Nullable)method
                             parameters:(id _Nullable)parameters
                             completion:(Completion _Nullable )completion;

- (nullable NSURLSessionDataTask *)upload:(NSString *)method
                               parameters:(id)parameters
                constructingBodyWithBlock:(void(^)(id <AFMultipartFormData> formData))block
                                 progress:(void(^)(NSProgress *uploadProgress))uploadProgress
                               completion:(Completion)completion;


@end
