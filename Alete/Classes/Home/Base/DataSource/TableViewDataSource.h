//
//  TableViewDataSource.h
//  AFNetworking
//
//  Created by alete on 2019/7/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TableViewDataSource <KeyType , ValueType>: NSObject

+(instancetype)initWithTableView:(UITableView *)tableview isGroup:(BOOL)group ;

-(void)registerClass:(Class)aClass forCellReuseIdentifier:(NSString *)identifier;

-(void)registerNib:(UINib *)nib forCellReuseIdentifier:(NSString *)identifier;

-(void)datasoucreWithDataList:(NSArray *)datalist withBlock:(void(^)(KeyType cell,ValueType value,NSIndexPath *indexPath))complete ;

-(void)reloadDataList:(NSArray *)datalist ;

@end

NS_ASSUME_NONNULL_END
