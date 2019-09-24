//
//  ViewFactory.m
//  Common
//
//  Created by alete on 2019/4/10.
//  Copyright © 2019 aletevcc. All rights reserved.
//

#import "ViewFactory.h"

@implementation ViewFactory
+(UIView *)creatUIViewWitClass:(Class)viewClass WithFrame:(CGRect)frame{
    UIView *target = [[viewClass alloc]init];
    target.frame = frame ;
    return target ;
}
+(UIView *)createUIViewWithFrame:(CGRect)frame{
    return [self createUIViewWithFrame:frame backGroundColor:UIColor.whiteColor];
}
+(UIView *)createUIViewWithFrame:(CGRect)frame backGroundColor:(UIColor *)backgroundColor{
    return [self createUIViewWithFrame:frame backGroundColor:backgroundColor cornerRadius:0.0f];
}
+(UIView *)createUIViewWithFrame:(CGRect)frame backGroundColor:(UIColor *)backgroundColor cornerRadius:(CGFloat)redius{
    UIView *view = [[UIView alloc]initWithFrame:frame];
    view.backgroundColor = backgroundColor ;
    view.layer.cornerRadius = redius ;
    view.layer.masksToBounds = true ;
    return view ;
}

@end
