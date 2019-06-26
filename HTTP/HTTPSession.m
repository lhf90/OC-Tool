//
//  HTTPSession.m
//  Platform
//
//  Created by 木子 on 2019/6/25.
//  Copyright © 2019 koki. All rights reserved.
//

#import "HTTPSession.h"

static NSString *const kAFCode        = @"code";
static NSString *const kAFSuccessCode = @"0";
static NSString *const kAFData        = @"data";
static NSString *const kAFMsg         = @"msg";
static NSString *const kAFNetError    = @"网络不给力,请稍后再试";

static NSString *const kMethod        = @"TerminalRest.do?method=";
static NSString *const kUploadMethod  = @"uploadUserLogo.do?method=";

@implementation HTTPSession

+ (instancetype)shared {
    
    static HTTPSession *_session = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _session = [[HTTPSession alloc]init];
        _session.requestSerializer.timeoutInterval = 40;
        AFJSONResponseSerializer *serializer = AFJSONResponseSerializer.serializer;
        serializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html",nil];
        serializer.removesKeysWithNullValues = true;
        _session.responseSerializer = serializer;
    });
    return _session;
}

- (NSURLSessionDataTask *)post:(NSString *)method
                    parameters:(id)parameters
                    completion:(Completion)completion {
    
    NSString *url = [NSString stringWithFormat:@"%@%@%@", environmentURL, kMethod, method];
    return [[HTTPSession shared]POST:url parameters:parameters headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if ([[responseObject objectForKey:kAFCode] isEqualToString:kAFSuccessCode]) {
            if (completion) {
                HTTPResponse *response = [[HTTPResponse alloc]initWithIsSuccess:true response:[responseObject objectForKey:kAFData] message:[responseObject objectForKey:kAFMsg]];
                completion(response);
            }
        } else {
            if (completion) {
                HTTPResponse *response = [[HTTPResponse alloc]initWithIsSuccess:false response:[responseObject objectForKey:kAFData] message:[responseObject objectForKey:kAFMsg]];
                completion(response);
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (completion) {
            HTTPResponse *response = [[HTTPResponse alloc]initWithIsSuccess:false response:nil message:kAFNetError];
            completion(response);
        }
    }];
}

- (NSURLSessionDataTask *)upload:(NSString *)method
                      parameters:(id)parameters
       constructingBodyWithBlock:(void (^)(id<AFMultipartFormData>))block
                        progress:(void (^)(NSProgress *))uploadProgress
                      completion:(Completion)completion {
    
    NSString *url = [NSString stringWithFormat:@"%@%@%@",environmentURL, kUploadMethod, method];
    return [[HTTPSession shared]POST:url parameters:parameters headers:nil constructingBodyWithBlock:block progress:uploadProgress success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if ([[responseObject objectForKey:kAFCode] isEqualToString:kAFSuccessCode]) {
            if (completion) {
                HTTPResponse *response = [[HTTPResponse alloc]initWithIsSuccess:true response:[responseObject objectForKey:kAFData] message:[responseObject objectForKey:kAFMsg]];
                completion(response);
            }
        } else {
            if (completion) {
                HTTPResponse *response = [[HTTPResponse alloc]initWithIsSuccess:false response:[responseObject objectForKey:kAFData] message:[responseObject objectForKey:kAFMsg]];
                completion(response);
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (completion) {
            HTTPResponse *response = [[HTTPResponse alloc]initWithIsSuccess:false response:nil message:kAFNetError];
            completion(response);
        }
    }];
}


@end
