//
//  ChartCollectionViewCell.m
//  CPlan
//
//  Created by mike on 7/25/16.
//  Copyright © 2016 mike. All rights reserved.
//

#import "ChartCollectionViewCell.h"
#import "UIView+CustomBorder.h"
#import <Masonry.h>
#import "UIImage+FX.h"
@interface ChartCollectionViewCell ()
@property (nonatomic, strong) UIImageView *voiceImage;
@property (nonatomic, strong) UILabel *lengthLabel;
@end

@implementation ChartCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self addSubview:self.voiceImage];
        [self addSubview:self.lengthLabel];
        [self layoutUI];
        [self bringSubviewToFront:self.lengthLabel];
        
       
        self.voiceImage.image = [[UIImage imageNamed:@"ImageSource.bundle/Voice.jpg"] imageScaledToFitSize:CGSizeMake(self.width, self.height)];
        self.lengthLabel.text = @"12''";
        
//        [self addTopBorderWithColor:[UIColor grayColor] width:1.9];
//        [self addLeftBorderWithColor:[UIColor grayColor] width:2];
//        [self addBottomBorderWithColor:[UIColor grayColor] width:1.9];
//        [self addRightBorderWithColor:[UIColor grayColor] width:2];
    }
    return self;
}

- (void)layoutUI{
    
    
    __weak typeof(self) weakSelf = self;
    [self.voiceImage  mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(weakSelf.mas_left);
        make.top.mas_equalTo(weakSelf.mas_top);
        make.right.mas_equalTo(weakSelf.mas_right);
        make.height.mas_equalTo(weakSelf.mas_width);
        
    }];
    
    [self.lengthLabel  mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(weakSelf.mas_left);
        make.top.mas_equalTo(weakSelf.mas_top);
        make.right.mas_equalTo(weakSelf.mas_right);
        make.height.mas_equalTo(weakSelf.mas_width);
        
    }];

}


- (UILabel *)lengthLabel{
    if (!_lengthLabel) {
        _lengthLabel = [[UILabel alloc]init];
        _lengthLabel.font = [UIFont boldSystemFontOfSize:20.0];
        _lengthLabel.textAlignment = NSTextAlignmentCenter;
        _lengthLabel.textColor = [UIColor whiteColor];
    }
    return _lengthLabel;


}

- (UIImageView *)voiceImage{
    
    if (!_voiceImage) {
        
        _voiceImage = [[UIImageView alloc] init];
        
    }
    
    return _voiceImage;
    
    
}



@end
