//
//  UIAlertController+SWRotation.h
//  Loko_iOS
//
//  Created by zhoushaowen on 2017/5/17.
//  Copyright © 2017年 loko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertController (SWRotation)

/**
 设置自动旋转
 
 @param sw_shouldAutorotate YES自定旋转,NO禁止旋转.
 */
- (void)setSw_shouldAutorotate:(BOOL)sw_shouldAutorotate;

@end
