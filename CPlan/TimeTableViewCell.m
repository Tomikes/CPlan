//
//  TimeTableViewCell.m
//  CPlan
//
//  Created by mike on 7/21/16.
//  Copyright © 2016 mike. All rights reserved.
//

#import "TimeTableViewCell.h"
#import <Masonry.h>
@interface TimeTableViewCell ()

@property (nonatomic, strong) UIImageView *img;
@property (nonatomic, strong) UILabel *showTime;

@end

@implementation TimeTableViewCell

- (UIImageView *)img{
    if (!_img) {
        _img = [[UIImageView alloc] init];
        _img.image = [UIImage imageNamed:@"rili"];
    }
    
    return _img;
}

- (UILabel *)showTime{
    if (!_showTime) {
        _showTime = [[UILabel alloc] init];
        _showTime.text = @"1981/09/09";
        _showTime.font = [UIFont systemFontOfSize:9*xA];
        
    }
    
    return _showTime;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    UIView *backView = [[UIView alloc] initWithFrame:self.frame];
    self.selectedBackgroundView = backView;
    self.selectedBackgroundView.backgroundColor = [UIColor clearColor];
    //取消边框线
    [self setBackgroundView:[[UIView alloc] init]];          //取消边框线
    self.backgroundColor = [UIColor clearColor];
    
    
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
       
        [self.contentView addSubview:self.showTime];
        [self.contentView addSubview:self.img];
        [self setUILayout];
        
        self.backgroundColor = [UIColor grayColor];
    }
    
    return  self;
}

- (void)setUILayout{
    
    __weak typeof(self) weakSelf = self;
    [self.img  mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(weakSelf.contentView.mas_left).with.offset(10);
        make.top.mas_equalTo(weakSelf.contentView.mas_top).with.offset(10);
        make.bottom.mas_equalTo(weakSelf.contentView.mas_bottom).with.offset(-10);
        make.width.mas_equalTo(30);
        
    }];
    [self.showTime  mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(weakSelf.img.mas_right).with.offset(10);
        make.top.mas_equalTo(weakSelf.contentView.mas_top).with.offset(10);
        make.bottom.mas_equalTo(weakSelf.contentView.mas_bottom).with.offset(-10);
        make.width.mas_greaterThanOrEqualTo(100);
        
    }];
    
}

@end
