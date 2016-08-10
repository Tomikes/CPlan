//
//  ChartCollectionReusableView.m
//  CPlan
//
//  Created by mike on 7/25/16.
//  Copyright © 2016 mike. All rights reserved.
//

#import "ChartCollectionReusableView.h"

@implementation ChartCollectionReusableView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _title = [[UILabel alloc]initWithFrame:CGRectMake(15.0, 0, frame.size.width - 15.0, frame.size.height)];
        _title.font = [UIFont boldSystemFontOfSize:17.0];
        _title.textAlignment = NSTextAlignmentLeft;
        _title.textColor = [UIColor orangeColor];
        [self addSubview:_title];
    }
    return self;
}

@end
