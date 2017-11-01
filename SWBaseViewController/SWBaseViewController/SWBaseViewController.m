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

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return UIInterfaceOrientationPortrait;
}

@end
