//
//  UIView+Alete.m
//  Alete
//
//  Created by alete on 2019/7/16.
//

#import "UIView+Alete.h"

@implementation UIView (Alete)
//@property (nonatomic, assign) CGFloat al_x ;
//@property (nonatomic, assign) CGFloat al_y ;
//@property (nonatomic, assign) CGFloat al_centerX ;
//@property (nonatomic, assign) CGFloat al_centerY ;
//@property (nonatomic, assign) CGPoint al_center ;
//@property (nonatomic, assign) CGFloat al_width ;
//@property (nonatomic, assign) CGFloat al_height ;
//@property (nonatomic, assign) CGPoint al_origin ;
//@property (nonatomic, assign) CGSize  al_size ;

-(CGFloat)al_x{
    return self.al_origin.x ;
}
-(void)setAl_x:(CGFloat)al_x{
    CGRect frame = self.frame ;
    frame.origin.x = al_x ;
    self.frame = frame ;
}
-(CGFloat)al_y{
    return self.al_origin.y ;
}
-(void)setAl_y:(CGFloat)al_y{
    CGRect frame = self.frame ;
    frame.origin.y = al_y ;
    self.frame = frame ;
}
-(CGFloat)al_centerX{
    CGRect frame = self.frame ;
    return frame.origin.x+frame.size.width/2.0 ;
}
-(void)setAl_centerX:(CGFloat)al_centerX{
    CGRect frame = self.frame ;
    frame.origin.x = al_centerX-frame.size.width/2.0 ;
    self.frame = frame ;
}
-(CGFloat)al_centerY{
    CGRect frame = self.frame ;
    return frame.origin.y+frame.size.height/2.0 ;
}
-(void)setAl_centerY:(CGFloat)al_centerY{
    CGRect frame = self.frame ;
    frame.origin.y = al_centerY-frame.size.height/2.0 ;
    self.frame = frame ;
}
-(CGPoint)al_center{
    return CGPointMake(self.al_centerX, self.al_centerY);
}
-(void)setAl_center:(CGPoint)al_center{
    self.al_centerX = al_center.x ;
    self.al_centerY = al_center.y ;
}
-(CGFloat)al_width{
    return self.al_size.width ;
}
-(void)setAl_width:(CGFloat)al_width{
    CGRect frame = self.frame ;
    frame.size.width = al_width ;
    self.frame = frame ;
}
-(CGFloat)al_height{
    return self.al_size.height ;
}
-(void)setAl_height:(CGFloat)al_height{
    CGRect frame = self.frame ;
    frame.size.height = al_height ;
    self.frame = frame ;
}
-(CGPoint)al_origin{
    return self.frame.origin ;
}
-(void)setAl_origin:(CGPoint)al_origin{
    self.al_x = al_origin.x ;
    self.al_y = al_origin.y ;
}
-(CGSize)al_size{
    return self.frame.size ;
}
-(void)setAl_size:(CGSize)al_size{
    self.al_width =al_size.width ;
    self.al_height = al_size.height ;
}


-(UIViewController *)viewController{
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}

-(void)roundHalf{
    
    [self layoutIfNeeded];
    self.layer.cornerRadius = self.bounds.size.height/2.0 ;
    self.layer.masksToBounds = true ;
    
}

-(void)setAl_redius:(CGFloat)al_redius{
    self.layer.cornerRadius = al_redius ;
    self.layer.masksToBounds = true ;
}


@end
