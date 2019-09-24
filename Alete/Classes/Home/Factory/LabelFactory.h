//
//  LabelFactory.h
//  Common
//
//  Created by alete on 2019/4/10.
//  Copyright © 2019 aletevcc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LabelFactory : NSObject

+(UILabel *)createLabelWithFrame:(CGRect)frame ;
+(UILabel *)createLabelWithFrame:(CGRect)frame
                            Text:(NSString *)text;
+(UILabel *)createLabelWithFrame:(CGRect)frame
                       TextColor:(UIColor *)textColor;
+(UILabel *)createLabelWithFrame:(CGRect)frame
                       TextColor:(UIColor *)textColor
                        TextFont:(UIFont *)font;
+(UILabel *)createLabelWithFrame:(CGRect)frame
                       TextColor:(UIColor *)textColor
                  TextAliagnmeng:(NSTextAlignment)alignment;

@end

NS_ASSUME_NONNULL_END
