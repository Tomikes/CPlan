//
//  ChartViewController.m
//  CPlan
//
//  Created by mike on 7/19/16.
//  Copyright © 2016 mike. All rights reserved.
//

#import "ChartViewController.h"
#import "ChartCollectionViewCell.h"
#import "ChartCollectionReusableView.h"
#import <Masonry.h>

@interface ChartViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collection;
@property (nonatomic, strong) NSMutableArray *array;

@end

@implementation ChartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    [self.view addSubview:self.collection];
    
    __weak typeof(self) weakSelf = self;
    [self.collection  mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(weakSelf.view.mas_left);
        make.top.mas_equalTo(weakSelf.view.mas_top);
        make.right.mas_equalTo(weakSelf.view.mas_right);
        make.bottom.mas_equalTo(weakSelf.view.mas_bottom);
        
    }];
    
       
}



- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 5;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    
    
    return 8;
}


#pragma mark: setting
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ChartCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"clCell" forIndexPath:indexPath];
   
    cell.backgroundColor = [UIColor whiteColor];

   
    return cell;

}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        ChartCollectionReusableView *reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"reuseCell" forIndexPath:indexPath];
        reusableView.backgroundColor = [UIColor whiteColor];
        
        reusableView.title.text = @"CPlan";
        
        return reusableView;
    }
    return nil;
}



- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
  
    
    NSLog(@"%ld",(long)indexPath.row);
    
}



- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(nonnull NSIndexPath *)indexPath{
    return YES;
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake((kScreenWidth - 25.0) / 4.0, (kScreenWidth - 25.0) / 4.0);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(kScreenWidth, 44.0);
}
// collection view
- (UICollectionView *)collection{
    
    if (!_collection) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 5.0;
        layout.minimumInteritemSpacing = 5.0;
        layout.sectionInset =  UIEdgeInsetsMake(5.0, 5.0, 5.0, 5.0);
        _collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        
        _collection.backgroundColor = [UIColor whiteColor];
        _collection.dataSource = self;
        _collection.delegate = self;
        
        [_collection registerClass:[ChartCollectionViewCell class] forCellWithReuseIdentifier:@"clCell"];
        [_collection registerClass:[ChartCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"reuseCell"];
          }
    
    return _collection;
}



@end
