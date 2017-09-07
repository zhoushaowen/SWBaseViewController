//
//  UIViewController+SWBaseViewController.h
//  SWBaseViewController
//
//  Created by zhoushaowen on 2017/4/21.
//  Copyright © 2017年 Yidu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (SWBaseViewController)

/**
 自定义的类似系统导航上的UINavigationBar
 */
@property (nonatomic,strong,readonly) UIView *sw_bar;

/**
 自定义bar下面的下划线
 */
@property (nonatomic,strong,readonly) UIImageView *sw_barBottomLine;

/**
 自定义bar的颜色
 */
@property (nonatomic,strong) UIColor *sw_barColor;

/**
 自定义bar的背景图片,设置之后为非nil之后毛玻璃效果会自动消失
 */
@property (nonatomic,strong) UIImage *sw_barBackgroundImage;
/**
 初始化界面的方法,请在系统的viewDidLoad里面调用
 */
- (void)sw_viewDidLoad;


@end
