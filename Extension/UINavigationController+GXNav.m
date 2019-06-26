//
//  UINavigationController+GXNav.m
//  Platform
//
//  Created by 木子 on 2018/12/19.
//  Copyright © 2018 koki. All rights reserved.
//

#import "UINavigationController+GXNav.h"
#import <objc/runtime.h>

@implementation UINavigationController (GXNav)

+(void)load{
    
    Method method1 = class_getInstanceMethod([self class], @selector(pushViewController:animated:));
    Method method2 = class_getInstanceMethod([self class], @selector(gx_pushViewController:animated:));
    method_exchangeImplementations(method1, method2);
}

- (void)gx_pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if (self.viewControllers.count) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [self gx_pushViewController:viewController animated:animated];
    
}


@end
