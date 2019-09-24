//
//  TableViewFactory.h
//  Common
//
//  Created by alete on 2019/4/10.
//  Copyright © 2019 aletevcc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TableViewFactory : NSObject

+(UITableView *)createTableViewWithDelegate:(NSObject<UITableViewDelegate,UITableViewDataSource>*)delegate ;

+(UITableView *)createTableViewWithDelegate:(NSObject<UITableViewDelegate,UITableViewDataSource>*)delegate showVertical:(BOOL)vertical showHorizontal:(BOOL)horizontal separatorStyle:(UITableViewCellSeparatorStyle)sparatorstyle ;

+(UITableView *)createTableViewWithDelegate:(NSObject<UITableViewDelegate,UITableViewDataSource>*)delegate showVertical:(BOOL)vertical showHorizontal:(BOOL)horizontal separatorStyle:(UITableViewCellSeparatorStyle)sparatorstyle superView:(UIView *)superView ;

@end

NS_ASSUME_NONNULL_END
