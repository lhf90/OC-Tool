
//
//  UINavigationController+Ex.m
//  ChinaBidding
//
//  Created by 木子 on 2019/8/8.
//  Copyright © 2019 木子. All rights reserved.
//

#import "UINavigationController+Ex.h"
#import <objc/runtime.h>

@implementation UINavigationController (Ex)

+ (void)load {
    
    Method method1 = class_getInstanceMethod([self class], @selector(pushViewController:animated:));
    Method method2 = class_getInstanceMethod([self class], @selector(ex_pushViewController:animated:));
    method_exchangeImplementations(method1, method2);
}

- (void)ex_pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    if (self.viewControllers.count) {
        
        viewController.hidesBottomBarWhenPushed = true;
    }
    [self ex_pushViewController:viewController animated:true];
}


@end
