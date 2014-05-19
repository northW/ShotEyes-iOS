//
//  ReportListTableViewController.m
//  ShotEyesiPAD
//
//  Created by kita on 14-5-13.
//  Copyright (c) 2014年 kita. All rights reserved.
//

#import "ReportListTableViewController.h"
#import "ReportListViewModel.h"
#import "Entities.h"
#import "ReportTableViewCell.h"
#import "ReportAddOrUpdateViewController.h"
#import "ReportDetailViewController.h"

@interface ReportListTableViewController ()
@property ReportListViewModel *viewModel;
@end

@implementation ReportListTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ReportAdd"]) {
        ReportAddOrUpdateViewModel *vm = [[ReportAddOrUpdateViewModel alloc] init];
        vm.category = self.viewModel.category;
        [(ReportAddOrUpdateViewController *)segue.destinationViewController setViewModel:vm];
    } else if ([segue.identifier isEqualToString:@"ReportDetail"]) {
        ReportTableViewCell *cell = sender;
        [(ReportDetailViewController *)segue.destinationViewController setModelWithReport:cell.model];
    }
}


-(void) setModelWithCategroy:(DACategory *)categroy
{
    self.title = categroy.name;
    self.viewModel = [[ReportListViewModel alloc] initWithCategory:categroy cellIdentifier:@"ReportCell" configureCellBlock:^(id cell, id item) {
        [cell setModelWithReport:item];
    }];
    self.tableView.dataSource = self.viewModel;
}

@end
