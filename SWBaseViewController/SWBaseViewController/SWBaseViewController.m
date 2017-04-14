//
//  SWBaseViewController.m
//  SWBaseViewController
//
//  Created by zhoushaowen on 2017/3/30.
//  Copyright © 2017年 Yidu. All rights reserved.
//

#import "SWBaseViewController.h"

@interface SWBaseViewController ()
{
    UIVisualEffectView *_visualView;
}
@property (nonatomic,strong) UIVisualEffectView *visualView;
@property (nonatomic,strong) UIImageView *barBackgroundImageView;

@end

@implementation SWBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.extendedLayoutIncludesOpaqueBars = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    if(!self.navigationController) return;
    _bar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
    _bar.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleBottomMargin;
    [self.view addSubview:_bar];
    _barBackgroundImageView = [[UIImageView alloc] initWithFrame:_bar.bounds];
    _barBackgroundImageView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    _barBackgroundImageView.contentMode = UIViewContentModeScaleAspectFill;
    _barBackgroundImageView.clipsToBounds = YES;
    [_bar addSubview:_barBackgroundImageView];
    
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    _visualView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    _visualView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    _visualView.frame = _bar.bounds;
    _visualView.contentView.hidden = YES;
    [_visualView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if([obj isKindOfClass:NSClassFromString(@"_UIVisualEffectFilterView")]){
            obj.backgroundColor = [UIColor colorWithWhite:0.97 alpha:0.8];
            *stop = YES;
        }
    }];
    [_bar addSubview:_visualView];
    
    CGFloat height = 1/[UIScreen mainScreen].scale;
    _barBottomLine = [[UIImageView alloc] initWithFrame:CGRectMake(0, _bar.frame.size.height, _visualView.frame.size.width, height)];
    _barBottomLine.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleTopMargin;
    _barBottomLine.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3f];
    [_bar addSubview:_barBottomLine];
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    if(!self.navigationController) return;
    [self.view bringSubviewToFront:_bar];
}

- (void)setBarColor:(UIColor *)barColor
{
    _barColor = barColor;
    if(!self.navigationController) return;
    if(_barColor == nil){
        __block NSInteger count = 0;
        [_visualView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
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
        [_visualView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
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
            frontFilterView.backgroundColor = _barColor;
            frontFilterView.alpha = 0.85f;
            [_visualView insertSubview:frontFilterView aboveSubview:behindFilterView];
        }
    }
}

- (void)setBarBackgroundImage:(UIImage *)barBackgroundImage
{
    _barBackgroundImage = barBackgroundImage;
    if(!self.navigationController) return;
    _barBackgroundImageView.image = _barBackgroundImage;
    _visualView.hidden = _barBackgroundImage != nil;
}

#pragma mark - rotation
- (BOOL)shouldAutorotate
{
    return NO;
}

@end
