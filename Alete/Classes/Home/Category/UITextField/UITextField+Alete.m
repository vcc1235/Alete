//
//  UITextField+Alete.m
//  Alete
//
//  Created by alete on 2019/7/16.
//

#import "UITextField+Alete.h"
#import "NSString+Alete.h"

@implementation UITextField (Alete)
-(void)placeHoldTextFont:(UIFont *)font TextColor:(UIColor *)color Text:(NSString *)placeHold{
    
    if (!placeHold) {
        placeHold = self.placeholder ;
    }
    NSMutableAttributedString *mutableAttributeString = [[NSMutableAttributedString alloc]initWithString:placeHold];
    if (font) {
        [mutableAttributeString addAttribute:NSFontAttributeName value:font range:[placeHold rangeOfString:placeHold]];
    }
    if (color) {
        [mutableAttributeString addAttribute:NSForegroundColorAttributeName value:color range:[placeHold rangeOfString:placeHold]];
    }
    self.attributedPlaceholder = mutableAttributeString ;
    
}

-(NSString *)trimText{
    
    if (![self hasText]) {
        return @"" ;
    }else if (!self.text.trim.length){
        return @"";
    }else{
        return self.text.trim ;
    }
}
@end
