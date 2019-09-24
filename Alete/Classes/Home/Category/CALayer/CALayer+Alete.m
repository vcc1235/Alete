//
//  CALayer+Alete.m
//  Alete
//
//  Created by alete on 2019/7/16.
//

#import "CALayer+Alete.h"

@implementation CALayer (Alete)
- (void)setBorderUIColor:(UIColor *)borderColor {
    [self setBorderColor:borderColor.CGColor];
}
-(void)showderRedius:(CGFloat)redius offset:(CGSize)size opacity:(CGFloat)opacity color:(UIColor *)color{
    self.shadowRadius = redius ;
    self.shadowOffset = size ;
    self.shadowOpacity = opacity ;
    self.shadowColor = color.CGColor ;
    self.masksToBounds = false ;
}

/*
 *  摇动
 */
-(void)shake{
    
    CAKeyframeAnimation *kfa = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.x"];
    CGFloat s = 5;
    kfa.values = @[@(-s),@(0),@(s),@(0),@(-s),@(0),@(s),@(0)];
    //时长
    kfa.duration = 0.3f;
    //重复
    kfa.repeatCount = 2;
    //移除
    kfa.removedOnCompletion = YES;
    [self addAnimation:kfa forKey:@"shake"];
    
}
@end
