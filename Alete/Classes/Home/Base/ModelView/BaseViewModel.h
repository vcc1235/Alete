//
//  BaseViewModel.h
//  Common
//
//  Created by alete on 2019/4/8.
//  Copyright © 2019 aletevcc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RACDisposable,RACCommand;
@protocol RACSubscriber ;
@protocol BaseModelDelegate ;
@protocol BaseViewModelDelegate <NSObject>

@optional
/**
 请求实现

 @param subscribe RAC回调
 @param action 操作类型
 @param input 参数
 @return return
 */
-(RACDisposable * __nullable)excutionRequestWithSubscribe:(id<RACSubscriber> __nonnull)subscribe action:(NSString * __nonnull)action andInput:(id __nullable)input ;

-(void(^_Nonnull)(NSString * _Nonnull action))createSignalNext:(void(^_Nonnull)(id _Nullable next))next ;
-(void(^_Nonnull)(NSString * _Nonnull action))createSignalNext:(void(^_Nullable)(id _Nullable next))next Error:(void(^_Nullable)(NSError * _Nullable error))error ;
-(void(^_Nonnull)(NSString * _Nonnull action))createSignalNext:(void(^_Nullable)(id _Nullable next))next Error:(void(^_Nullable)(NSError * _Nullable error))error complete:(void(^_Nullable)(void))complete ;

//-(RACCommand *(^_Nonnull)(NSString * _Nonnull action))requestCommand ;
@property (nonatomic, strong) RACCommand*(^requestCommand)(NSString *action) ;

@end

NS_ASSUME_NONNULL_BEGIN

@interface BaseViewModel : NSObject <BaseViewModelDelegate>


@end

NS_ASSUME_NONNULL_END
