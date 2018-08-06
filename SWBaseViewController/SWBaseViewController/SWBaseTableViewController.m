//
//  SWBaseTableViewController.m
//  SWBaseViewController
//
//  Created by zhoushaowen on 2018/8/6.
//  Copyright © 2018年 Yidu. All rights reserved.
//

#import "SWBaseTableViewController.h"

@interface SWBaseTableViewController ()

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic) UITableViewStyle style;

@end

@implementation SWBaseTableViewController

- (instancetype)initWithStyle:(UITableViewStyle)style {
    self = [super initWithNibName:nil bundle:nil];
    if(self){
        self.style = style;
    }
    return self;
}

- (void)loadView {
    self.tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:self.style];
    self.view = self.tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
