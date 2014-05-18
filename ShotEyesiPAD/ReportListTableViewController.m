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
    
    self.refreshControl = [[UIRefreshControl alloc]init];
    
    @weakify(self);
    [RACObserve(self.viewModel,list) subscribeNext:^(id x) {
        @strongify(self);
        [self.tableView reloadData];
    }];
    
    [[self.refreshControl rac_signalForControlEvents:UIControlEventValueChanged] subscribeNext:^(id x) {
        @strongify(self);
        [[[self.viewModel reloadSignal] finally:^{
            [self.refreshControl endRefreshing];
        }] subscribeCompleted:^{
            
        }];
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.viewModel.list count];

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ReportTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ReportCell" forIndexPath:indexPath];
    
    [cell setModelWithReport:[self.viewModel.list objectAtIndex:indexPath.row]];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ReportAdd"]) {
        ReportAddOrUpdateViewModel *vm = [[ReportAddOrUpdateViewModel alloc] init];
        vm.category = self.viewModel.category;
        [(ReportAddOrUpdateViewController *)segue.destinationViewController setViewModel:vm];
    }
}


-(void) setModelWithCategroy:(DACategory *)categroy
{
    self.title = categroy.name;
    self.viewModel = [[ReportListViewModel alloc] initWithCategory:categroy];
}

@end
