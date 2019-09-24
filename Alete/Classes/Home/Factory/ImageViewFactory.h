//
//  ImageViewFactory.h
//  AFNetworking
//
//  Created by alete on 2019/7/19.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ImageViewFactory : UIView


+(UIImageView *)createImageViewWithFrame:(CGRect)frame ;

+(UIImageView *)createImageViewWithFrame:(CGRect)frame image:(UIImage *)image ;

+(UIImageView *)createImageViewWithFrame:(CGRect)frame redius:(CGFloat)redius ;

+(UIImageView *)createImageViewWithFrame:(CGRect)frame image:(UIImage *)image redius:(CGFloat)redius ;

@end

NS_ASSUME_NONNULL_END
