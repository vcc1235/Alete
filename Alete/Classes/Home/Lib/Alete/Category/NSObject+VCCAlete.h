//
//  NSObject+VCCAlete.h
//  AFNetworking
//
//  Created by alete on 2019/8/8.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class VccAlete ;
@interface NSObject (VCCAlete)

@property (nonatomic, strong) VccAlete *vcc ;

-(void)dispose ;

@end

NS_ASSUME_NONNULL_END
