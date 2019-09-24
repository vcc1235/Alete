//
//  ImageViewFactory.m
//  AFNetworking
//
//  Created by alete on 2019/7/19.
//

#import "ImageViewFactory.h"

@implementation ImageViewFactory

+(UIImageView *)createImageViewWithFrame:(CGRect)frame{
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.contentMode = UIViewContentModeScaleAspectFill ;
    imageView.frame = frame ;
    return imageView ;
}

+(UIImageView *)createImageViewWithFrame:(CGRect)frame image:(UIImage *)image{
    UIImageView *imageView = [self createImageViewWithFrame:frame];
    imageView.contentMode = UIViewContentModeScaleAspectFill ;
    imageView.image = image ;
    return imageView ;
}

+(UIImageView *)createImageViewWithFrame:(CGRect)frame image:(UIImage *)image redius:(CGFloat)redius{
    UIImageView *imageView = [self createImageViewWithFrame:frame image:image];
    imageView.contentMode = UIViewContentModeScaleAspectFill ;
    imageView.layer.cornerRadius = redius ;
    imageView.layer.masksToBounds = true ;
    return imageView ;
}

+(UIImageView *)createImageViewWithFrame:(CGRect)frame redius:(CGFloat)redius{
    
    UIImageView *imageView = [self createImageViewWithFrame:frame];
    imageView.layer.cornerRadius = redius ;
    imageView.layer.masksToBounds = true ;
    imageView.contentMode = UIViewContentModeScaleAspectFill ;
    return imageView ;
    
}





/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
