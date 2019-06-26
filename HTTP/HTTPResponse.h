//
//  HTTPResponse.h
//  Platform
//
//  Created by 木子 on 2019/6/25.
//  Copyright © 2019 koki. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HTTPResponse : NSObject

@property (nonatomic, strong, readonly) id       response;
@property (nonatomic, copy, readonly  ) NSString *message;
@property (nonatomic, assign, readonly) BOOL     isSuccess;
- (instancetype)initWithIsSuccess:(BOOL )isSuccess response:(id)response message:(NSString *)message;

@end

