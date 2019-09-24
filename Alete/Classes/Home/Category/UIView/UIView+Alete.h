//
//  UIView+Alete.h
//  Alete
//
//  Created by alete on 2019/7/16.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Alete)

@property (nonatomic, assign) CGFloat al_x ;
@property (nonatomic, assign) CGFloat al_y ;
@property (nonatomic, assign) CGFloat al_centerX ;
@property (nonatomic, assign) CGFloat al_centerY ;
@property (nonatomic, assign) CGPoint al_center ;
@property (nonatomic, assign) CGFloat al_width ;
@property (nonatomic, assign) CGFloat al_height ;
@property (nonatomic, assign) CGPoint al_origin ;
@property (nonatomic, assign) CGSize  al_size ;




@property (nonatomic, assign) CGFloat al_redius ;

-(UIViewController *)viewController ;

-(void)roundHalf ;

@end

NS_ASSUME_NONNULL_END
