//
//  ViewFactory.h
//  Common
//
//  Created by alete on 2019/4/10.
//  Copyright © 2019 aletevcc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ViewFactory : NSObject

+(UIView *_Nonnull)creatUIViewWitClass:(Class _Nonnull)viewClass
                     WithFrame:(CGRect)frame ;
+(UIView *)createUIViewWithFrame:(CGRect)frame ;
+(UIView *)createUIViewWithFrame:(CGRect)frame
                 backGroundColor:(UIColor *)backgroundColor;
+(UIView *)createUIViewWithFrame:(CGRect)frame
                 backGroundColor:(UIColor *)backgroundColor
                    cornerRadius:(CGFloat)redius;

@end

NS_ASSUME_NONNULL_END
