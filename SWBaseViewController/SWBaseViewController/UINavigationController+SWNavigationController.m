//
//  UINavigationController+SWNavigationController.m
//  Loko_iOS
//
//  Created by zhoushaowen on 2017/4/25.
//  Copyright © 2017年 loko. All rights reserved.
//

#import "UINavigationController+SWNavigationController.h"
#import <objc/runtime.h>

@implementation UINavigationController (SWNavigationController)

+ (void)load {
    Method systemMethod = class_getInstanceMethod([self class], @selector(preferredStatusBarStyle));
    Method customMethod = class_getInstanceMethod([self class], @selector(sw_preferredStatusBarStyle));
    method_exchangeImplementations(systemMethod, customMethod);
}

- (UIStatusBarStyle)sw_preferredStatusBarStyle {
    return [[UIApplication sharedApplication].delegate window].rootViewController.preferredStatusBarStyle;
}

@end
