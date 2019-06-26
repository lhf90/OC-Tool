
//
//  UIViewController+GXExample.m
//  Tenderee
//
//  Created by koki on 2018/5/23.
//  Copyright © 2018年 koki. All rights reserved.
//

#import "UIViewController+GXExample.h"
#import <objc/runtime.h>


@implementation UIViewController (GXExample)

+ (void)load{
    
    Method method1 = class_getInstanceMethod([self class], NSSelectorFromString(@"dealloc"));
    Method method2 = class_getInstanceMethod([self class], @selector(deallocSwizzle));
    method_exchangeImplementations(method1, method2);
    Method method3 = class_getInstanceMethod([self class], @selector(viewDidLoad));
    Method method4 = class_getInstanceMethod([self class], @selector(gx_viewDidLoad));
    method_exchangeImplementations(method3, method4);
}

- (void)deallocSwizzle{
    
    NSLog(@"%@被销毁了",self);
    [self deallocSwizzle];
}

- (void)gx_viewDidLoad{
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:NULL];
}

static char taskKey;
- (void)setTask:(NSURLSessionDataTask *)task{
    objc_setAssociatedObject(self, &taskKey, task, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSURLSessionDataTask *)task{
    return objc_getAssociatedObject(self, &taskKey);
}

@end
