//
//  ButtonFactory.h
//  Common
//
//  Created by alete on 2019/4/10.
//  Copyright © 2019 aletevcc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface ButtonFactory : NSObject

+(UIButton *)createButtonWithFrame:(CGRect)frame ;
+(UIButton *)createButtonWithFrame:(CGRect)frame
                             Title:(NSString *)title;
+(UIButton *)createButtonWithFrame:(CGRect)frame
                             Title:(NSString *)title
                        TitleColor:(UIColor *)titleColor;
+(UIButton *)createButtonWithFrame:(CGRect)frame
                             image:(UIImage *)image;
+(UIButton *)createButtonWithFrame:(CGRect)frame
                    backgroudImage:(UIImage *)backgroudImage;
+ (UIButton *)createButtonWithNormalImageName:(NSString *)normalImageName
                         highlightedImageName:(NSString *)highlightedImageName
                            selectedImageName:(NSString *)selectedImageName;
@end

NS_ASSUME_NONNULL_END
