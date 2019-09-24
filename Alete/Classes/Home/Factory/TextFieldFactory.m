//
//  TextFieldFactory.m
//  AFNetworking
//
//  Created by alete on 2019/7/18.
//

#import "TextFieldFactory.h"

@implementation TextFieldFactory

+(UITextField *)createTextFieldWithFrame:(CGRect)frame{
    UITextField *textField = [[UITextField alloc]initWithFrame:frame];
    return textField ;
}

+(UITextField *)createTextFieldWithFrame:(CGRect)frame bordStyle:(UITextBorderStyle)bordStyle{
    UITextField *textField = [self createTextFieldWithFrame:frame];
    textField.borderStyle = bordStyle ;
    return textField ;
}

+(UITextField *)createTextFieldWithFrame:(CGRect)frame placeHold:(NSString *)placeHold{
    UITextField *textField = [self createTextFieldWithFrame:frame];
    textField.placeholder = placeHold ;
    return textField ;
}

+(UITextField *)createTextFieldWithFrame:(CGRect)frame placeHold:(NSString *)placeHold bordStyle:(UITextBorderStyle)bordStyle{
    UITextField *textField = [self createTextFieldWithFrame:frame];
    textField.placeholder = placeHold ;
    textField.borderStyle = bordStyle ;
    return textField ;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
