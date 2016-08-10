//
//  GetDayTaskApi.m
//  CPlan
//
//  Created by mike on 7/28/16.
//  Copyright © 2016 mike. All rights reserved.
//

#import "GetDayTaskApi.h"
#import "YTKKeyValueStore.h"
#import "DayTask.h"
@implementation GetDayTaskApi

+ (instancetype)shareInstance{
    static GetDayTaskApi *ins = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ins = [[GetDayTaskApi alloc] init];
    });
    return ins;
}

- (void)getDayTaskWithKey:(NSString *)key
             SuccessBlock:(void(^)(DayTask *dt))success
                  failure:(void(^)(void))failure{
     YTKKeyValueStore *store = [[YTKKeyValueStore alloc] initDBWithName:@"cplan.db"];
   ;
    DayTask *queryTask = [store getObjectById:key fromTable:@"user_table"];
   
    if (queryTask) {
        if (success) {
            success(queryTask);
        }
    }else{
        if (failure) {
            failure();
        }
    }
    
    
}

@end
