//
//  TextFieldFactory.h
//  AFNetworking
//
//  Created by alete on 2019/7/18.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TextFieldFactory : UIView

+(UITextField *)createTextFieldWithFrame:(CGRect)frame ;

+(UITextField *)createTextFieldWithFrame:(CGRect)frame bordStyle:(UITextBorderStyle)bordStyle ;

+(UITextField *)createTextFieldWithFrame:(CGRect)frame placeHold:(NSString *)placeHold ;

+(UITextField *)createTextFieldWithFrame:(CGRect)frame placeHold:(NSString *)placeHold bordStyle:(UITextBorderStyle)bordStyle ;

@end

NS_ASSUME_NONNULL_END
