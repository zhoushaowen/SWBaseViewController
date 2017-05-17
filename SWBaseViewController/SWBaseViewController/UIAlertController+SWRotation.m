//
//  UIAlertController+SWRotation.m
//  Loko_iOS
//
//  Created by zhoushaowen on 2017/5/17.
//  Copyright © 2017年 loko. All rights reserved.
//

#import "UIAlertController+SWRotation.h"
#import <objc/runtime.h>
static void *SW_shouldAutorotate_key = &SW_shouldAutorotate_key;

@interface UIAlertController ()

@property (nonatomic) BOOL sw_shouldAutorotate;// 是否允许自动旋转,默认NO

@end

@implementation UIAlertController (SWRotation)

+ (void)load {
    Method systemMethod = class_getInstanceMethod([self class], @selector(shouldAutorotate));
    Method customMethod = class_getInstanceMethod([self class], @selector(sw_shouldAutorotate));
    method_exchangeImplementations(systemMethod, customMethod);
}

- (void)setSw_shouldAutorotate:(BOOL)sw_shouldAutorotate {
    objc_setAssociatedObject(self, SW_shouldAutorotate_key, @(sw_shouldAutorotate), OBJC_ASSOCIATION_RETAIN);
}

- (BOOL)sw_shouldAutorotate {
    return [objc_getAssociatedObject(self, SW_shouldAutorotate_key) boolValue];
}

@end
