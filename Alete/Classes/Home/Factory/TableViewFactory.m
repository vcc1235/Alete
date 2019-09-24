//
//  TableViewFactory.m
//  Common
//
//  Created by alete on 2019/4/10.
//  Copyright © 2019 aletevcc. All rights reserved.
//

#import "TableViewFactory.h"

@implementation TableViewFactory
+(UITableView *)createTableViewWithDelegate:(NSObject<UITableViewDelegate,UITableViewDataSource>*)delegate{
    return [self createTableViewWithDelegate:delegate showVertical:false showHorizontal:false separatorStyle:UITableViewCellSeparatorStyleNone];
}
+(UITableView *)createTableViewWithDelegate:(NSObject<UITableViewDelegate,UITableViewDataSource>*)delegate showVertical:(BOOL)vertical showHorizontal:(BOOL)horizontal separatorStyle:(UITableViewCellSeparatorStyle)sparatorstyle{
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    tableView.delegate = delegate ;
    tableView.dataSource = delegate ;
    tableView.showsVerticalScrollIndicator = vertical ;
    tableView.showsHorizontalScrollIndicator = horizontal ;
    tableView.separatorStyle = sparatorstyle ;
    return tableView ;
}
+(UITableView *)createTableViewWithDelegate:(NSObject<UITableViewDelegate,UITableViewDataSource>*)delegate showVertical:(BOOL)vertical showHorizontal:(BOOL)horizontal separatorStyle:(UITableViewCellSeparatorStyle)sparatorstyle superView:(UIView *)superView{
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    tableView.delegate = delegate ;
    tableView.dataSource = delegate ;
    tableView.showsVerticalScrollIndicator = vertical ;
    tableView.showsHorizontalScrollIndicator = horizontal ;
    tableView.separatorStyle = sparatorstyle ;
    [superView addSubview:tableView];
    return tableView ;
}
@end
