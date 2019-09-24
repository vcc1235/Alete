//
//  ButtonFactory.m
//  Common
//
//  Created by alete on 2019/4/10.
//  Copyright © 2019 aletevcc. All rights reserved.
//

#import "ButtonFactory.h"

@implementation ButtonFactory
+(UIButton *)createButtonWithFrame:(CGRect)frame{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame ;
    return button ;
}
+(UIButton *)createButtonWithFrame:(CGRect)frame Title:(NSString *)title{
    UIButton *button = [self createButtonWithFrame:frame];
    [button setTitle:title forState:UIControlStateNormal];
    return button ;
}
+(UIButton *)createButtonWithFrame:(CGRect)frame Title:(NSString *)title TitleColor:(UIColor *)titleColor{
    UIButton *button = [self createButtonWithFrame:frame Title:title];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    return button ;
}
+(UIButton *)createButtonWithFrame:(CGRect)frame image:(UIImage *)image{
    UIButton *button = [self createButtonWithFrame:frame];
    [button setImage:image forState:UIControlStateNormal];
    return button ;
}
+(UIButton *)createButtonWithFrame:(CGRect)frame backgroudImage:(UIImage *)backgroudImage{
    UIButton *button = [self createButtonWithFrame:frame];
    [button setBackgroundImage:backgroudImage forState:UIControlStateNormal];
    return button ;
}

/**
 *  创建一个按钮
 *
 *  @param normalImageName      默认图片名
 *  @param highlightedImageName 高亮时 图片名
 *  @param selectedImageName    选中图片名
 *
 *  @return UIButton
 */
+ (UIButton *)createButtonWithNormalImageName:(NSString *)normalImageName
                         highlightedImageName:(NSString *)highlightedImageName
                            selectedImageName:(NSString *)selectedImageName
{
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[[UIImage imageNamed:normalImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [button setImage:[[UIImage imageNamed:highlightedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateHighlighted];
    [button setImage:[[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateSelected];
    return button;
}


@end
