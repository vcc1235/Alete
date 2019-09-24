//
//  UIImage+Alete.h
//  Alete
//
//  Created by alete on 2019/7/16.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Alete)

/**
 线性渐变色
 
 @param startColor  startColor
 @param endColor <#endColor description#>
 @return <#return value description#>
 */
+(UIImage *)addGradientImageStartColor:(UIColor *)startColor endColor:(UIColor *)endColor ;

/**
 颜色转图片

 @param color color description
 @return return value description
 */
+ (UIImage *)al_imageWithColor:(UIColor *)color;

/**
 颜色转图片
 @param color color description
 @param size size description
 @return return value description
 */
+ (UIImage *)al_imageWithColor:(UIColor *)color size:(CGSize)size;
@end

NS_ASSUME_NONNULL_END
