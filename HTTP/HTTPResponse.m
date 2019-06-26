//
//  HTTPResponse.m
//  Platform
//
//  Created by 木子 on 2019/6/25.
//  Copyright © 2019 koki. All rights reserved.
//

#import "HTTPResponse.h"

@interface HTTPResponse ()

@property (nonatomic, strong) id       response;
@property (nonatomic, copy  ) NSString *message;
@property (nonatomic, assign) BOOL     isSuccess;

@end

@implementation HTTPResponse

- (instancetype)initWithIsSuccess:(BOOL)isSuccess response:(id)response message:(NSString *)message{
    self = [super init];
    if (self) {
        self.isSuccess = isSuccess;
        self.response  = response;
        self.message   = message;
    }
    return self;
}

@end
