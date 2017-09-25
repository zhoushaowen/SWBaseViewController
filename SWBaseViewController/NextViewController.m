//
//  NextViewController.m
//  SWBaseViewController
//
//  Created by zhoushaowen on 2017/4/7.
//  Copyright © 2017年 Yidu. All rights reserved.
//

#import "NextViewController.h"
#import "SWVisualEffectView.h"

@interface NextViewController ()

@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
    //设置导航为透明
    self.sw_barBackgroundImage = [UIImage new];
    //设置背景图
//    self.sw_barBackgroundImage = [UIImage imageNamed:@"2"];
    //隐藏下划线
    self.sw_barBottomLineImage = [UIImage new];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
