
//
//  UIViewController+Ex.m
//  ChinaBidding
//
//  Created by 木子 on 2019/8/8.
//  Copyright © 2019 木子. All rights reserved.
//

#import "UIViewController+Ex.h"
#import <objc/runtime.h>

@implementation UIViewController (Ex)

+ (void)load {
    
    Method method1 = class_getInstanceMethod([self class], @selector(viewDidLoad));
    Method method2 = class_getInstanceMethod([self class], @selector(ex_viewDidLoad));
    method_exchangeImplementations(method1, method2);
    
    Method method3 = class_getInstanceMethod([self class], NSSelectorFromString(@"dealloc"));
    Method method4 = class_getInstanceMethod([self class], @selector(deallocSwizzle));
    method_exchangeImplementations(method3, method4);
}

- (void)deallocSwizzle{
    NSLog(@"%@被销毁了",self);
    [self deallocSwizzle];
}

- (void)ex_viewDidLoad{
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:NULL];
}

static char kTaskKey;
- (void)setTask:(NSURLSessionDataTask *)task{
    objc_setAssociatedObject(self, &kTaskKey, task, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSURLSessionDataTask *)task{
    return objc_getAssociatedObject(self, &kTaskKey);
}


@end
