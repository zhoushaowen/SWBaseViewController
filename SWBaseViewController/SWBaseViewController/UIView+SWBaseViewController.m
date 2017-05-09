//
//  UIView+SWBaseViewController.m
//  Loko_iOS
//
//  Created by zhoushaowen on 2017/5/9.
//  Copyright © 2017年 loko. All rights reserved.
//

#import "UIView+SWBaseViewController.h"
#import <objc/runtime.h>
#import "SWBaseViewController.h"

@implementation UIView (SWBaseViewController)

+ (void)load {
    Method systemMethod = class_getInstanceMethod([self class], @selector(addSubview:));
    Method customMethod = class_getInstanceMethod([self class], @selector(sw_addSubview:));
    method_exchangeImplementations(systemMethod, customMethod);
}

- (void)sw_addSubview:(UIView *)view {
    [self sw_addSubview:view];
    if([[self nextResponder] isKindOfClass:[SWBaseViewController class]]){
        SWBaseViewController *vc = (SWBaseViewController *)[self nextResponder];
        if(vc.navigationController){
            [self bringSubviewToFront:vc.sw_bar];
        }
    }
}

@end
