//
//  VCRBrowerFuncShow.h
//  AFNetworking
//
//  Created by alete on 2019/8/8.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class VCRBrowerModel ;
@protocol VCRBrowerFuncShowDelegate <NSObject>

-(void)initWithBrower:(VCRBrowerModel *)model andIndex:(NSInteger)index ;

@end


@interface VCRBrowerModel : NSObject

@property (nonatomic, strong) NSString *title ;

@property (nonatomic, strong) NSString *imageName ;

@property (nonatomic, strong) NSString *urlImage ;

@property (nonatomic, assign) NSInteger index ;

@end


@interface VCRBrowerFuncShow : NSObject

+(instancetype)initWithBrower:(NSArray<VCRBrowerModel *>*)array delegate:(id<VCRBrowerFuncShowDelegate>)delegate  ;

+(instancetype)initWithBrower:(NSArray<VCRBrowerModel *>*)array title:(NSString *)title delegate:(id<VCRBrowerFuncShowDelegate>)delegate  ;

-(void)show ;

@end

NS_ASSUME_NONNULL_END
