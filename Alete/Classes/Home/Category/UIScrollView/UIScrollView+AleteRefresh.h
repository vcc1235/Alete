//
//  UIScrollView+AleteRefresh.h
//  AFNetworking
//
//  Created by alete on 2019/7/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^AleteRefreshComponentRefreshingBlock)(void);
@interface UIScrollView (AleteRefresh)

-(void)headerWithRefreshingBlock:(AleteRefreshComponentRefreshingBlock)refreshingBlock;

-(void)headerWithRefreshingTarget:(id)target refreshingAction:(SEL)action;
/** 创建footer */
-(void)footerWithRefreshingBlock:(AleteRefreshComponentRefreshingBlock)refreshingBlock;
/** 创建footer */
-(void)footerWithRefreshingTarget:(id)target refreshingAction:(SEL)action;

-(void)endRefresh ;
-(void)endHeaderRefresh ;
-(void)endFooterRefresh ;

@end

NS_ASSUME_NONNULL_END
