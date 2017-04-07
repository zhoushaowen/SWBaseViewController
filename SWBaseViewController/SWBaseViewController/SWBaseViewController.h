//
//  SWBaseViewController.h
//  SWBaseViewController
//
//  Created by zhoushaowen on 2017/3/30.
//  Copyright © 2017年 Yidu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SWBaseViewController : UIViewController

@property (nonatomic,strong,readonly) UIView *bar;
@property (nonatomic,strong,readonly) UIImageView *barBottomLine;
@property (nonatomic,strong) UIColor *barColor;
@property (nonatomic,strong) UIImage *barBackgroundImage;


@end
