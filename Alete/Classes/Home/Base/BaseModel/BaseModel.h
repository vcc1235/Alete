//
//  BaseModel.h
//  AFNetworking
//
//  Created by alete on 2019/7/17.
//

#import <Foundation/Foundation.h>
#import "YYModel.h"
NS_ASSUME_NONNULL_BEGIN
@protocol YYModel ,BaseModelDelegate;
typedef void(^callBack)(id <BaseModelDelegate> __nullable model);
@protocol BaseModelDelegate <YYModel>
/// 返回码
@property (nonatomic, assign) NSInteger code ;
/// 返回信息
@property (nonatomic, copy) NSString *msg ;
/// 返回结果
@property (nonatomic, strong) id resultObject ;
/// 数组<self>
@property (nonatomic, strong) NSArray <id<BaseModelDelegate>>*resultArray ;

-(void)vc_modelSetWithJSON:(id)object ;

-(NSString *)resultForKey ;

@end

@interface BaseModel : NSObject <BaseModelDelegate>


@end

NS_ASSUME_NONNULL_END
