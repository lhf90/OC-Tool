//
//  HTTPSession.m
//  ChinaBidding
//
//  Created by 木子 on 2019/8/8.
//  Copyright © 2019 木子. All rights reserved.
//

#import "HTTPSession.h"

static NSString *const kAFHeader      = @"header";
static NSString *const kAFCode        = @"returnCode";
static NSString *const kAFMsg         = @"msg";
static NSString *const kAFSuccessCode = @"0";
static NSString *const kAFData        = @"data";
static NSString *const kAFNetError    = @"网络不给力,请稍后再试";

@implementation HTTPSession

+ (instancetype)shared {
 
    static HTTPSession *_session = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _session = [[HTTPSession alloc]init];
        _session.requestSerializer.timeoutInterval = 40;
        AFJSONResponseSerializer *response = AFJSONResponseSerializer.serializer;
        response.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", @"text/plain", nil];
        response.removesKeysWithNullValues = true;
        _session.responseSerializer = response;
    });
    return _session;
}

/**
 POST Method
 */
- (NSURLSessionDataTask *)post:(NSString *)method
                    parameters:(id)parameters
                    completion:(void (^)(BOOL, NSString * _Nullable, id _Nullable))completion {
    
    NSString *controller = @"tSBaseUserController";
    return [[HTTPSession shared]post:method controller:controller parameters:parameters completion:completion];
}

/**
 POST Method With Controller
 */
- (NSURLSessionDataTask *)post:(NSString *)method
                    controller:(NSString *)controller
                    parameters:(id)parameters
                    completion:(void (^)(BOOL, NSString * _Nullable, id _Nullable))completion {
    
    NSString *baseURL = [NSString stringWithFormat:@"%@%@%@", kEnvironmentURL, controller, method];
    return [[HTTPSession shared]POST:baseURL parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (completion != nil) {
            NSDictionary *header = [responseObject objectForKey:kAFHeader];
            NSString *message = [header objectForKey:kAFMsg];
            if ([[header objectForKey:kAFCode] isEqualToString:kAFSuccessCode]) {
                completion(true, message, [responseObject objectForKey:kAFData]);
            } else {
                completion(false, message, nil);
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (completion != nil) {
            completion(false, kAFNetError, nil);
        }
    }];
}

- (NSURLSessionDataTask *)upload:(NSString *)method
                      parameters:(id)parameters
       constructingBodyWithBlock:(void (^)(id<AFMultipartFormData> _Nonnull))block
                        progress:(void (^)(NSProgress * _Nonnull))uploadProgress
                      completion:(void (^)(BOOL, NSString * _Nullable, id _Nullable))completion {

    NSString *controller = @"CgformUpload";
    NSString *baseURL = [NSString stringWithFormat:@"%@%@%@", kEnvironmentURL, controller, method];
    return [[HTTPSession shared]POST:baseURL parameters:parameters constructingBodyWithBlock:block progress:uploadProgress success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (completion != nil) {
            NSDictionary *header = [responseObject objectForKey:kAFHeader];
            NSString *message = [header objectForKey:kAFMsg];
            if ([[header objectForKey:kAFCode] isEqualToString:kAFSuccessCode]) {
                completion(true, message, [responseObject objectForKey:kAFData]);
            } else {
                completion(false, message, nil);
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (completion != nil) {
            completion(false, kAFNetError, nil);
        }
    }];
}


@end
