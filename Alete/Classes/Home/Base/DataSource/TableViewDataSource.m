//
//  TableViewDataSource.m
//  AFNetworking
//
//  Created by alete on 2019/7/25.
//

#import "TableViewDataSource.h"

@interface TableViewDataSource () <UITableViewDataSource>

@property (nonatomic, assign) BOOL isGroup ;

@property (nonatomic, strong) UITableView *tableView ;

@property (nonatomic, strong) NSString *identifier ;

@property (nonatomic, strong) NSArray *datalist ;

@property (nonatomic, strong) void(^complete)(id cell,id value ,NSIndexPath *indexPath) ;

@end

@implementation TableViewDataSource

+(instancetype)initWithTableView:(UITableView *)tableview isGroup:(BOOL)group{
    
    TableViewDataSource *datasource = [[TableViewDataSource alloc]init];
    if (datasource) {
        datasource.isGroup = group ;
        datasource.tableView = tableview ;
        tableview.dataSource = datasource ;
    }
    return datasource ;
}
-(void)registerClass:(Class)aClass forCellReuseIdentifier:(NSString *)identifier{
    self.identifier = identifier ;
    [self.tableView registerClass:aClass forCellReuseIdentifier:identifier];
}
-(void)registerNib:(UINib *)nib forCellReuseIdentifier:(NSString *)identifier{
    self.identifier = identifier ;
    [self registerNib:nib forCellReuseIdentifier:identifier];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (self.isGroup) {
        return [self.datalist count];
    }
    return 1 ;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.isGroup) {
        NSArray *list = [self.datalist objectAtIndex:section];
        return [list count];
    }else{
        return [self.datalist count];
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.identifier];
    if (self.isGroup) {
        NSArray *list = [self.datalist objectAtIndex:indexPath.section];
        id obj = [list objectAtIndex:indexPath.row];
        self.complete(cell, obj, indexPath);
    }else{
        id obj = [self.datalist objectAtIndex:indexPath.row];
        self.complete(cell, obj, indexPath);
    }
    return cell ;
}


-(void)datasoucreWithDataList:(NSArray *)datalist withBlock:(void (^)(id _Nonnull, id _Nonnull, NSIndexPath * _Nonnull))complete{
    self.complete = complete ;
    self.datalist = datalist;
    [self.tableView reloadData];
}

-(void)reloadDataList:(NSArray *)datalist{
    self.datalist = datalist ;
    [self.tableView reloadData];
}




@end
