//
//  ReportDetailViewController.m
//  ShotEyesiPAD
//
//  Created by kita on 14-5-18.
//  Copyright (c) 2014年 kita. All rights reserved.
//

#import "ReportDetailViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "ReportAddOrUpdateViewController.h"
#import "ReportAddOrUpdateViewModel.h"


@interface ReportDetailViewController ()

@end

@implementation ReportDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    @weakify(self);
    
    RAC(self.txtTitle, text) = [RACObserve(self.viewModel.model,title) distinctUntilChanged];
    RAC(self.txtSummary, text) = [RACObserve(self.viewModel.model,summary) distinctUntilChanged];
    
    [[RACObserve(self.viewModel.imageViewModel, model) distinctUntilChanged] subscribeNext:^(id x) {
        @strongify(self);
        
        [self.viewModel.imageViewModel setImageInImageView:self.imgPhoto placeholderImage:nil];
        
    }];
    
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
    if ([segue.identifier isEqualToString:@"ReportEdit"]) {
//        ReportAddOrUpdateViewModel *vm = [[ReportAddOrUpdateViewModel alloc] initWithModel:self.viewModel.model category:self.viewModel.category];
        [(ReportAddOrUpdateViewController *)segue.destinationViewController setViewModel:self.viewModel];
    }
}

-(void)setModelWithReport:(DAReport *)report category:(DACategory *)category
{
    self.viewModel = [[ReportAddOrUpdateViewModel alloc] initWithModel:report category:category];
}


@end
