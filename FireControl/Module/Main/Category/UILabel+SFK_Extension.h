//
//  UILabel+SFK_Extension.h
//  SFKStudentCenterNew
//
//  Created by sfk-ios on 2017/7/19.
//  Copyright © 2017年 北京斯芬克教育咨询有限公司. All rights reserved.
//  注！：要自己计算高度

#import <UIKit/UIKit.h>

@interface UILabel (SFK_Extension)

/**
 *  改变行间距
 */
+ (void)changeLineSpaceForLabel:(UILabel *)label WithSpace:(float)space;

/**
 *  改变字间距
 */
+ (void)changeWordSpaceForLabel:(UILabel *)label WithSpace:(float)space;

/**
 *  改变行间距和字间距
 */
+ (void)changeSpaceForLabel:(UILabel *)label withLineSpace:(float)lineSpace WordSpace:(float)wordSpace;

@end
