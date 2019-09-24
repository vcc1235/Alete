//
//  UITextField+Alete.h
//  Alete
//
//  Created by alete on 2019/7/16.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (Alete)
/** 设置placeHold字体属性 **/
-(void)placeHoldTextFont:(UIFont *)font TextColor:(UIColor *)color Text:(NSString *)placeHold ;
/** 获取输入内容 **/
-(NSString *)trimText ;
@end

NS_ASSUME_NONNULL_END
