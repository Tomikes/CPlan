//
//  RewardTableViewCell.m
//  CPlan
//
//  Created by mike on 7/21/16.
//  Copyright © 2016 mike. All rights reserved.
//

#import "RewardTableViewCell.h"
#import <Masonry.h>
#import "UIImage+FX.h"

@interface RewardTableViewCell ()

@property (nonatomic, strong) UILabel *reward;
@property (nonatomic, strong) UIImageView *img;//
@property (nonatomic, strong) UIImageView *share;
@property (nonatomic, strong) UIImageView *menu;


@end

@implementation RewardTableViewCell

- (UIImageView *)share{
    if (!_share) {
        _share = [[UIImageView alloc] init];
        _share.image = [[UIImage imageNamed:@"ImageSource.bundle/share.png"] imageScaledToFitSize:CGSizeMake(30, 30)];
    }
    return _share;
}

- (UIImageView *)menu{
    if (!_menu) {
        _menu = [[UIImageView alloc] init];
        _menu.image = [[UIImage imageNamed:@"ImageSource.bundle/menu.png"] imageScaledToFitSize:CGSizeMake(30, 30)];
    }
    return _menu;
}

- (UILabel *)reward{
    if (!_reward) {
        _reward = [[UILabel alloc] init];
        _reward.text = @"Reward";
        _reward.font = [UIFont systemFontOfSize:9*xA];

    }
    return _reward;
}

- (UIImageView *)img{
    if (!_img) {
        _img = [[UIImageView alloc] init];
        _img.image = [[UIImage imageNamed:@"ImageSource.bundle/demo.png"] imageScaledToFitSize:CGSizeMake(kScreenWidth-20, (kScreenWidth-20)*0.58)];
    }
    return _img;
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
        //选中时背景透明
        
        [self.contentView addSubview:self.reward];
        [self.contentView addSubview:self.img];
        [self.contentView addSubview:self.share];
        [self.contentView addSubview:self.menu];
        
        [self setUILayout];
    }
    
    return self;
}

- (void)setUILayout{
    __weak typeof(self) weakSelf = self;
    
    [self.reward  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.contentView.mas_left).with.offset(10);
        make.top.mas_equalTo(weakSelf.contentView.mas_top).with.offset(10);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(30);
    }];
    
    [self.img  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.contentView.mas_left).with.offset(10);
        make.top.mas_equalTo(weakSelf.reward.mas_bottom).with.offset(10);
        make.right.mas_equalTo(weakSelf.contentView.mas_right).with.offset(-10);
        make.bottom.mas_equalTo(weakSelf.share.mas_top).with.offset(-15);
        
    }];
    
    [self.menu  mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.mas_equalTo(weakSelf.contentView.mas_right).with.offset(-30);
        make.bottom.mas_equalTo(weakSelf.contentView.mas_bottom).with.offset(-10);
        make.width.mas_equalTo(26);
        make.height.mas_equalTo(26);
    }];
    
    [self.share  mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.mas_equalTo(weakSelf.menu.mas_left).with.offset(-10);
        make.bottom.mas_equalTo(weakSelf.contentView.mas_bottom).with.offset(-10);
        make.size.mas_equalTo(CGSizeMake(30, 30));
        
    }];

}
@end
