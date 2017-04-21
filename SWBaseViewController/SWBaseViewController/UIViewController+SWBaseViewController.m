//
//  UIViewController+SWBaseViewController.m
//  SWBaseViewController
//
//  Created by zhoushaowen on 2017/4/21.
//  Copyright © 2017年 Yidu. All rights reserved.
//

#import "UIViewController+SWBaseViewController.h"
#import <objc/runtime.h>

static void *SW_bar_key = &SW_bar_key;
static void *SW_barBottomLine_key = &SW_barBottomLine_key;
static void *SW_barColor_key = &SW_barColor_key;
static void *SW_barBackgroundImage_key = &SW_barBackgroundImage_key;
static void *SW_shouldAutorotate_key = &SW_shouldAutorotate_key;
static void *SW_visualView_key = &SW_visualView_key;
static void *SW_barBackgroundImageView_key = &SW_barBackgroundImageView_key;

@interface UIViewController ()
//category私有属性
@property (nonatomic,strong) UIVisualEffectView *sw_visualView;
@property (nonatomic,strong) UIImageView *sw_barBackgroundImageView;

@end

@implementation UIViewController (SWBaseViewController)

@dynamic sw_bar;
@dynamic sw_barBottomLine;
@dynamic sw_barColor;
@dynamic sw_barBackgroundImage;
@dynamic sw_shouldAutorotate;

#pragma mark - Public
- (void)sw_viewDidLoad {
    self.extendedLayoutIncludesOpaqueBars = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    if(!self.navigationController) return;
    self.sw_bar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
    self.sw_bar.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleBottomMargin;
    [self.view addSubview:self.sw_bar];
    self.sw_barBackgroundImageView = [[UIImageView alloc] initWithFrame:self.sw_bar.bounds];
    self.sw_barBackgroundImageView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    self.sw_barBackgroundImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.sw_barBackgroundImageView.clipsToBounds = YES;
    [self.sw_bar addSubview:self.sw_barBackgroundImageView];
    
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    self.sw_visualView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    self.sw_visualView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    self.sw_visualView.frame = self.sw_bar.bounds;
    self.sw_visualView.contentView.hidden = YES;
    [self.sw_visualView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if([obj isKindOfClass:NSClassFromString(@"_UIVisualEffectFilterView")]){
            obj.backgroundColor = [UIColor colorWithWhite:0.97 alpha:0.8];
            *stop = YES;
        }
    }];
    [self.sw_bar addSubview:self.sw_visualView];
    
    CGFloat height = 1/[UIScreen mainScreen].scale;
    self.sw_barBottomLine = [[UIImageView alloc] initWithFrame:CGRectMake(0, self.sw_bar.frame.size.height, self.sw_visualView.frame.size.width, height)];
    self.sw_barBottomLine.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleTopMargin;
    self.sw_barBottomLine.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3f];
    [self.sw_bar addSubview:self.sw_barBottomLine];
}

- (void)sw_viewWillLayoutSubviews
{
    if(!self.navigationController) return;
    [self.view bringSubviewToFront:self.sw_bar];
}

#pragma mark - Setter&Getter
- (void)setSw_bar:(UIView *)sw_bar {
    objc_setAssociatedObject(self, SW_bar_key, sw_bar, OBJC_ASSOCIATION_RETAIN);
}

- (UIView *)sw_bar {
    return objc_getAssociatedObject(self, SW_bar_key);
}

- (void)setSw_barBottomLine:(UIImageView *)sw_barBottomLine {
    objc_setAssociatedObject(self, SW_barBottomLine_key, sw_barBottomLine, OBJC_ASSOCIATION_RETAIN);
}

- (UIImageView *)sw_barBottomLine {
    return objc_getAssociatedObject(self, SW_barBottomLine_key);
}

- (void)setSw_barColor:(UIColor *)sw_barColor {
    objc_setAssociatedObject(self, SW_barColor_key, sw_barColor, OBJC_ASSOCIATION_RETAIN);
    if(!self.navigationController) return;
    if(sw_barColor == nil){
        __block NSInteger count = 0;
        [self.sw_visualView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if([obj isKindOfClass:NSClassFromString(@"_UIVisualEffectFilterView")]){
                obj.backgroundColor = [UIColor colorWithWhite:0.97 alpha:0.8];
                count ++;
                if(count>1){
                    [obj removeFromSuperview];
                    *stop = YES;
                }
            }
        }];
    }else{
        __block NSInteger count = 0;
        __block UIView *behindFilterView = nil;
        __block UIView *frontFilterView = nil;
        [self.sw_visualView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if([obj isKindOfClass:NSClassFromString(@"_UIVisualEffectFilterView")]){
                obj.backgroundColor = [UIColor colorWithWhite:0.97 alpha:0.8];
                count ++;
                if(count>1){
                    frontFilterView = obj;
                }else{
                    behindFilterView = obj;
                }
            }
        }];
        behindFilterView.backgroundColor = [UIColor colorWithWhite:0.97 alpha:0.5];
        if(frontFilterView == nil){
            frontFilterView = [[NSClassFromString(@"_UIVisualEffectFilterView") alloc] initWithFrame:behindFilterView.bounds];
            frontFilterView.backgroundColor = self.sw_barColor;
            frontFilterView.alpha = 0.85f;
            [self.sw_visualView insertSubview:frontFilterView aboveSubview:behindFilterView];
        }
    }
}

- (UIColor *)sw_barColor {
    return objc_getAssociatedObject(self, SW_barColor_key);
}

- (void)setSw_barBackgroundImage:(UIImage *)sw_barBackgroundImage {
    objc_setAssociatedObject(self, &sw_barBackgroundImage, sw_barBackgroundImage, OBJC_ASSOCIATION_RETAIN);
    if(!self.navigationController) return;
    self.sw_barBackgroundImageView.image = sw_barBackgroundImage;
    self.sw_visualView.hidden = sw_barBackgroundImage != nil;
}

- (UIImage *)sw_barBackgroundImage {
    return objc_getAssociatedObject(self, SW_barBackgroundImage_key);
}

- (void)setSw_shouldAutorotate:(BOOL)sw_shouldAutorotate {
    objc_setAssociatedObject(self, SW_shouldAutorotate_key, @(sw_shouldAutorotate), OBJC_ASSOCIATION_RETAIN);
}

- (BOOL)sw_shouldAutorotate {
    return [objc_getAssociatedObject(self, SW_shouldAutorotate_key) boolValue];
}

- (void)setSw_visualView:(UIVisualEffectView *)sw_visualView {
    objc_setAssociatedObject(self, SW_visualView_key, sw_visualView, OBJC_ASSOCIATION_RETAIN);
}

- (UIVisualEffectView *)sw_visualView {
    return objc_getAssociatedObject(self, SW_visualView_key);
}

- (void)setSw_barBackgroundImageView:(UIImageView *)sw_barBackgroundImageView {
    objc_setAssociatedObject(self, SW_barBackgroundImageView_key, sw_barBackgroundImageView, OBJC_ASSOCIATION_RETAIN);
}

- (UIImageView *)sw_barBackgroundImageView {
    return objc_getAssociatedObject(self, SW_barBackgroundImageView_key);
}




@end
