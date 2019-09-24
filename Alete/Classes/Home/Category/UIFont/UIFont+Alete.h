//
//  UIFont+Alete.h
//  AFNetworking
//
//  Created by alete on 2019/7/17.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#define FontSize(size)              [UIFont customWithSize:size]
#define FontMediumSize(Size)        [UIFont customWithMediumSize:Size]
#define FontBoldSize(Size)          [UIFont customWithBoldSize:Size]
#define FontLightSize(Size)         [UIFont customWithLightSize:Size]
#define FontUlrtralightSize(Size)   [UIFont customWithUltralightSize:Size]


@interface UIFont (Alete)

/// default 0 ;
+(void)systemDefaultSize:(CGFloat)size ;

+(UIFont *)customWithSize:(CGFloat)size ;

+(UIFont *)customWithMediumSize:(CGFloat)size ;

+(UIFont *)customWithBoldSize:(CGFloat)size ;

+(UIFont *)customWithLightSize:(CGFloat)size;

+(UIFont *)customWithUltralightSize:(CGFloat)size ;

@end

NS_ASSUME_NONNULL_END
