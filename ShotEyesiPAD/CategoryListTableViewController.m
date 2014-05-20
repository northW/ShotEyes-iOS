//
//  CategoryListTableViewController.m
//  ShotEyesiPAD
//
//  Created by kita on 14-5-13.
//  Copyright (c) 2014年 kita. All rights reserved.
//

#import "CategoryListTableViewController.h"
#import "Entities.h"
#import "CategoryTableViewCell.h"
#import "ReportListTableViewController.h"
#import "APIUrl.h"

@interface CategoryListTableViewController ()
@end

@implementation CategoryListTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {

    }
    return self;
}

- (void)viewDidLoad
{
    // 
    self.viewModel = [[BaseListViewModel alloc] initWithViewModelClass:[DACategory class] APIPath:kUrlCategoryList cellIdentifier:@"CategoryCell" configureCellBlock:^(id cell, id item) {
        [cell setDataWithCategory:item];
    }];
    
    
    
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
    if ([segue.identifier isEqualToString:@"ReportList"]) {
        CategoryTableViewCell *cell = sender;
        
        [(ReportListTableViewController *)segue.destinationViewController setModelWithCategroy:cell.categroy];
    }
}


@end
