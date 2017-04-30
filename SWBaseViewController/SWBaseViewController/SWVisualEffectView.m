//
//  SWVisualEffectView.m
//  SWBaseViewController
//
//  Created by zhoushaowen on 2017/4/30.
//  Copyright © 2017年 Yidu. All rights reserved.
//

#import "SWVisualEffectView.h"

@implementation SWVisualEffectView
{
    UIVisualEffectView *_visualView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
        _visualView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
        _visualView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        _visualView.frame = self.bounds;
        _visualView.contentView.hidden = YES;
        [_visualView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if([obj isKindOfClass:NSClassFromString(@"_UIVisualEffectFilterView")]){
                obj.backgroundColor = [UIColor colorWithWhite:0.97 alpha:0.8];
                *stop = YES;
            }
        }];
        [self addSubview:_visualView];
    }
    return self;
}

- (void)setSw_tintColor:(UIColor *)sw_tintColor {
    _sw_tintColor = sw_tintColor;
    if(_sw_tintColor == nil){
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
            frontFilterView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
            frontFilterView.backgroundColor = _sw_tintColor;
            frontFilterView.alpha = 0.85f;
            [_visualView insertSubview:frontFilterView aboveSubview:behindFilterView];
        }
    }

}



@end
