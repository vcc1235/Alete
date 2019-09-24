//
//  CALayer+Alete.h
//  Alete
//
//  Created by alete on 2019/7/16.
//

#import <QuartzCore/QuartzCore.h>

NS_ASSUME_NONNULL_BEGIN

@interface CALayer (Alete)
/// 边框 用于xib
- (void)setBorderUIColor:(UIColor *)borderColor  ;

/**
 设置阴影
 @param redius redius description
 @param size size description
 @param opacity opacity description
 @param color color description
 */
-(void)showderRedius:(CGFloat)redius offset:(CGSize)size opacity:(CGFloat)opacity color:(UIColor *)color ;

/**
 摇动
 */
-(void)shake ;



@end

NS_ASSUME_NONNULL_END
