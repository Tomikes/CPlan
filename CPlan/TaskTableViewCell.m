   //
//  TaskTableViewCell.m
//  CPlan
//
//  Created by mike on 7/21/16.
//  Copyright © 2016 mike. All rights reserved.
//

#import "TaskTableViewCell.h"
#import <Masonry.h>
#import "UIImage+FX.h"
@interface TaskTableViewCell ()

@property (nonatomic, strong) UIImageView *message;
@property (nonatomic, strong) UILabel *cplanT;

@end

@implementation TaskTableViewCell

- (UILabel *)cplanT{
    if (!_cplanT) {
        _cplanT = [[UILabel alloc] init];
        _cplanT.text = @"CPlan";
        _cplanT.font = [UIFont systemFontOfSize:9*xA];
        
    }
    return _cplanT;
}

- (UIImageView *)message{
    if (!_message) {
        
        _message = [[UIImageView alloc] init];
         _message.image = [[UIImage imageNamed:@"ImageSource.bundle/Voice.jpg"] imageScaledToFitSize:CGSizeMake(130, 130)];
    }
    return _message;
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
        
        [self.contentView addSubview:self.message];
        [self.contentView addSubview:self.cplanT];
        [self setUILayout];
    }
    
    return self;
}

- (void)setUILayout{
    
    __weak typeof(self) weakSelf = self;
    
    [self.cplanT  mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(weakSelf.contentView.mas_left).with.offset(10);
        make.top.mas_equalTo(weakSelf.contentView.mas_top).with.offset(10);
        make.right.mas_equalTo(weakSelf.contentView.mas_right);
        make.height.mas_equalTo(30);
    }];

    [self.message  mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(weakSelf.cplanT.mas_bottom).with.offset(20);
        make.centerX.mas_equalTo(weakSelf.contentView.mas_centerX);
        make.width.mas_equalTo(130);
        make.bottom.mas_equalTo(weakSelf.contentView.mas_bottom).with.offset(-10);
        
    }];
    
    
}

@end
