//
//  LabelFactory.m
//  Common
//
//  Created by alete on 2019/4/10.
//  Copyright © 2019 aletevcc. All rights reserved.
//

#import "LabelFactory.h"

@implementation LabelFactory
+(UILabel *)createLabelWithFrame:(CGRect)frame{
    UILabel *label = [[UILabel alloc]initWithFrame:frame];
    return label ;
}
+(UILabel *)createLabelWithFrame:(CGRect)frame Text:(NSString *)text{
    UILabel *label = [self createLabelWithFrame:frame];
    label.text = text ;
    return label ;
}
+(UILabel *)createLabelWithFrame:(CGRect)frame TextColor:(UIColor *)textColor{
    UILabel *label = [self createLabelWithFrame:frame];
    label.textColor = textColor ;
    return label ;
}

+(UILabel *)createLabelWithFrame:(CGRect)frame TextColor:(UIColor *)textColor TextFont:(UIFont *)font{
    UILabel *label = [self createLabelWithFrame:frame TextColor:textColor];
    label.font = font ;
    return label ;
}
+(UILabel *)createLabelWithFrame:(CGRect)frame TextColor:(UIColor *)textColor TextAliagnmeng:(NSTextAlignment)alignment{
    UILabel *label = [[UILabel alloc]initWithFrame:frame];
    label.textColor = textColor ;
    label.textAlignment = NSTextAlignmentCenter ;
    return label ;
}
@end
