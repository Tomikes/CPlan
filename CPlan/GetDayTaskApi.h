//
//  GetDayTaskApi.h
//  CPlan
//
//  Created by mike on 7/28/16.
//  Copyright © 2016 mike. All rights reserved.
//

#import <Foundation/Foundation.h>
@class DayTask;
@interface GetDayTaskApi : NSObject

+ (instancetype)shareInstance;

- (void)getDayTaskWithKey:(NSString *)key
             SuccessBlock:(void(^)(DayTask *dt))success
                  failure:(void(^)(void))failure;

@end
