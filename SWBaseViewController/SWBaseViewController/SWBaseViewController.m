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

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    [self sw_viewWillLayoutSubviews];
}

#pragma mark - rotation
- (BOOL)shouldAutorotate
{
    return self.sw_shouldAutorotate;
}

@end
