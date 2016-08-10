//
//  MainViewController.m
//  CPlan
//
//  Created by mike on 7/18/16.
//  Copyright © 2016 mike. All rights reserved.
//

#import "MainViewController.h"

#import "MainTableViewController.h"

@interface MainViewController ()

@property (nonatomic, strong) MainTableViewController *mTableTableView;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //set frame
    //...
    
    self.mTableTableView.tableView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    [self.view addSubview:self.mTableTableView.tableView];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (MainTableViewController *)mTableTableView{
    if (_mTableTableView == nil) {
        _mTableTableView = [[MainTableViewController alloc] init];
    }
    return _mTableTableView;
    
}


@end
