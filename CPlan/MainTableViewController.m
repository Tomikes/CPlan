//
//  MainTableViewController.m
//  CPlan
//
//  Created by mike on 7/20/16.
//  Copyright © 2016 mike. All rights reserved.
//

#import "MainTableViewController.h"
#import "RewardTableViewCell.h"
#import "UITableView+FDTemplateLayoutCell.h"
#import "TimeTableViewCell.h"
#import "TaskTableViewCell.h"
#import "GetDayTaskApi.h"
#import "DayTask.h"
#import "NSUserDefaults+SafeAccess.h"
@interface MainTableViewController ()

@property (nonatomic, strong) NSMutableArray <DayTask *>*tasks;

@end

@implementation MainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[RewardTableViewCell class] forCellReuseIdentifier:@"democell"];//顺序方反了纠错了
    [self.tableView registerClass:[TimeTableViewCell class] forCellReuseIdentifier:@"time"];
    [self.tableView registerClass:[TaskTableViewCell class] forCellReuseIdentifier:@"task"];
    
    if ([self respondsToSelector:@selector(automaticallyAdjustsScrollViewInsets)]) {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    self.tableView.contentInset = UIEdgeInsetsMake(64, 0, 48, 0);
    self.tableView.scrollIndicatorInsets = UIEdgeInsetsMake(64, 0, 48, 0);
    
    
    // 取消滚动条
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.showsHorizontalScrollIndicator = NO;
    self.tableView.multipleTouchEnabled = NO;
    
    [self.tableView setSeparatorInset:UIEdgeInsetsZero];
    [self.tableView setLayoutMargins:UIEdgeInsetsZero];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getTask) name:@"GETTASK" object:nil];
    
}

- (void)getTask{
    __block  NSMutableArray *add = [NSMutableArray array];
    GetDayTaskApi *api = [GetDayTaskApi shareInstance];
    NSArray *adds = [self getTenItem];
    if (adds) {
        [adds enumerateObjectsUsingBlock:^(NSString *key, NSUInteger idx, BOOL *stop){
            
            [api getDayTaskWithKey:key SuccessBlock:^(DayTask *dt){
                [add addObject:dt];
            } failure:^{
                
            }];
        }];
        self.tasks = add;
    }

}
- (NSMutableArray <DayTask *> *)tasks{
    
    if (!_tasks) {
        
      __block  NSMutableArray *add = [NSMutableArray array];
        GetDayTaskApi *api = [GetDayTaskApi shareInstance];
        NSArray *adds = [self getTenItem];
        if (adds) {
            [adds enumerateObjectsUsingBlock:^(NSString *key, NSUInteger idx, BOOL *stop){
            
                [api getDayTaskWithKey:key SuccessBlock:^(DayTask *dt){
                    [add addObject:dt];
                } failure:^{
                    
                }];
            }];
            _tasks = add;
        }

    }
    
    return _tasks;
    
}

- (NSArray *)getTenItem{
 
    NSArray *ar = [NSUserDefaults arrayForKey:@"Taskid"];
    return ar;
}


#pragma mark - Table view data source


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    //    return self.tasks.count;
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    if (indexPath.row == 2) {
        RewardTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"democell" forIndexPath:indexPath];
        //config
        return cell;
    }
    if (indexPath.row == 0) {
        TimeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"time" forIndexPath:indexPath];
        return cell;
    }
    
    if (indexPath.row == 1) {
        TaskTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"task" forIndexPath:indexPath];
        return cell;
    }
    
    return nil;
  
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 2) {
        return [self.tableView fd_heightForCellWithIdentifier:@"democell" cacheByIndexPath:indexPath configuration:^(RewardTableViewCell *cell) {
            //config
        }];
    }
    if (indexPath.row == 0) {
        return 51;
    }
    if (indexPath.row == 1) {
        return 200;
    }

    return 0;
   
}
#pragma mark 点击cell会怎么样
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    

    // 滚到顶端
    [tableView scrollToNearestSelectedRowAtScrollPosition:UITableViewScrollPositionMiddle animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [cell setSeparatorInset:UIEdgeInsetsZero];
    [cell setLayoutMargins:UIEdgeInsetsZero];
    
}

@end
