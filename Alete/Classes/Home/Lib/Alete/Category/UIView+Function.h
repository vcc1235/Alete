//
//  UIView+Function.h
//  AFNetworking
//
//  Created by alete on 2019/8/8.
//

#import <UIKit/UIKit.h>
#import "NSObject+VCCAlete.h"
#import "VccAlete.h"
#import "VCRFuncTool.h"
#import "VCRBrowerFuncShow.h"
NS_ASSUME_NONNULL_BEGIN

@interface UIView (Function)

@property (nonatomic, strong) VccAlete <UIView *,VCRFuncTool *>*vcc ;

@property (nonatomic, strong) VccAlete <UIView *,VCRBrowerFuncShow *>*alete ;

@end

NS_ASSUME_NONNULL_END
