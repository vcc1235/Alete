//
//  UIScrollView+AleteRefresh.m
//  AFNetworking
//
//  Created by alete on 2019/7/25.
//

#import "UIScrollView+AleteRefresh.h"
#import <MJRefresh/MJRefresh.h>
@implementation UIScrollView (AleteRefresh)

-(void)headerWithRefreshingTarget:(id)target refreshingAction:(SEL)action{
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:target refreshingAction:action];
    header.lastUpdatedTimeLabel.hidden = true ;
    header.stateLabel.hidden = true ;
    self.mj_header = header ;
}
-(void)headerWithRefreshingBlock:(AleteRefreshComponentRefreshingBlock)refreshingBlock{
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:refreshingBlock];
    header.lastUpdatedTimeLabel.hidden = true ;
    header.stateLabel.hidden = true ;
    self.mj_header = header ;
}

-(void)footerWithRefreshingTarget:(id)target refreshingAction:(SEL)action{
    MJRefreshBackNormalFooter *footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:target refreshingAction:action];
    self.mj_footer = footer ;
}
-(void)footerWithRefreshingBlock:(AleteRefreshComponentRefreshingBlock)refreshingBlock{
    MJRefreshBackNormalFooter *footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:refreshingBlock];
    self.mj_footer = footer ;
}

-(void)endRefresh{
    [self.mj_footer endRefreshing];
    [self.mj_header endRefreshing];
}
-(void)endHeaderRefresh{
    [self.mj_header endRefreshing];
}
-(void)endFooterRefresh{
    [self.mj_footer endRefreshing];
}

@end
