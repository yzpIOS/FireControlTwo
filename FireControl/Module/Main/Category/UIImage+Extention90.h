//
//  UIImage+Extention90.h
//  SFKStudentCenter
//
//  Created by sfk-ios on 2017/4/13.
//  Copyright © 2017年 SKF. All rights reserved.
//  解决上传相机照片旋转90°的问题

#import <UIKit/UIKit.h>

@interface UIImage (Extention90)
/// 让图片旋转到正确方向
+ (UIImage *)fixOrientation:(UIImage *)aImage;
/// 模糊效果
+ (UIImage *)boxblurImage:(UIImage *)image withBlurNumber:(CGFloat)blur;
/// 通过颜色创建图片
+ (UIImage *)imageWithColor:(UIColor *)color;
/**
 *  根据图片url获取图片尺寸
 */
+ (CGSize)getImageSizeWithURL:(id)URL;
//// 获取图片主色调
+ (UIColor *)mainColorOfImage:(UIImage *)image;
@end
