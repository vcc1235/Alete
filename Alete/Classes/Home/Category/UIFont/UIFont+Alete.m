//
//  UIFont+Alete.m
//  AFNetworking
//
//  Created by alete on 2019/7/17.
//

#import "UIFont+Alete.h"

@implementation UIFont (Alete)
+(void)systemDefaultSize:(CGFloat)size{
    if (size<0.00) {
        size = 0.00 ;
    }
    [NSUserDefaults.standardUserDefaults setFloat:size forKey:@"customFontSize"];
}
+(UIFont *)customWithSize:(CGFloat)size{
    CGFloat x = [NSUserDefaults.standardUserDefaults floatForKey:@"customFontSize"];
    return [UIFont fontWithName:@"PingFangSC-Regular" size:size+x];
}
+(UIFont *)customWithMediumSize:(CGFloat)size{
    CGFloat x = [NSUserDefaults.standardUserDefaults floatForKey:@"customFontSize"];
    return [UIFont fontWithName:@"PingFangSC-Medium" size:size+x];
}
+(UIFont *)customWithBoldSize:(CGFloat)size{
    CGFloat x = [NSUserDefaults.standardUserDefaults floatForKey:@"customFontSize"];
    return [UIFont fontWithName:@"PingFangSC-Semibold" size:size+x];
}
+(UIFont *)customWithLightSize:(CGFloat)size{
    CGFloat x = [NSUserDefaults.standardUserDefaults floatForKey:@"customFontSize"];
    return [UIFont fontWithName:@"PingFangSC-Light" size:size+x];
}
+(UIFont *)customWithUltralightSize:(CGFloat)size{
    CGFloat x = [NSUserDefaults.standardUserDefaults floatForKey:@"customFontSize"];
    return [UIFont fontWithName:@"PingFangSC-Ultralight" size:size+x];
}
@end

