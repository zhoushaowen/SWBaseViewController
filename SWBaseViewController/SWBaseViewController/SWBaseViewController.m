//
//  SWBaseViewController.m
//  SWBaseViewController
//
//  Created by zhoushaowen on 2017/3/30.
//  Copyright © 2017年 Yidu. All rights reserved.
//

#import "SWBaseViewController.h"

@interface SWBaseViewController ()

@end

@implementation SWBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self sw_viewDidLoad];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [[[UIApplication sharedApplication].delegate window].rootViewController setNeedsStatusBarAppearanceUpdate];
}

- (BOOL)shouldAutorotate {
    return NO;
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    if (@available(iOS 11.0, *)) {
        self.sw_bar.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.safeAreaInsets.top);
    } else {
        CGFloat height = 44.0;
        height += [UIApplication sharedApplication].isStatusBarHidden ? 0 : 20;
        self.sw_bar.frame = CGRectMake(0, 0, self.view.bounds.size.width, height);
    }
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return UIInterfaceOrientationPortrait;
}

@end
