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
    // bind title to view
    RAC(self.txtTitle, text) = [RACObserve(self.viewModel.model,title) distinctUntilChanged];
    
    RAC(self.txtSummary, text) = [RACObserve(self.viewModel.model,summary) distinctUntilChanged];
    
    [[RACObserve(self.viewModel.model, picture) distinctUntilChanged] subscribeNext:^(id x) {
        @strongify(self);
//        [self.imgPhoto setImageWithURL:[NSURL URLWithString:[self.viewModel reportImageURLString]]];
        
        [self.imgPhoto setImageWithURL:[NSURL URLWithString:[self.viewModel reportImageURLString]] placeholderImage:nil options:SDWebImageHandleCookies];
        
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
        ReportAddOrUpdateViewModel *vm = [[ReportAddOrUpdateViewModel alloc] init];
        vm.model = self.viewModel.model;
//        vm.category = self.viewModel.category;
        [(ReportAddOrUpdateViewController *)segue.destinationViewController setViewModel:vm];
    }
}

-(void)setModelWithReport:(DAReport *)report
{
    self.viewModel = [[ReportDetailViewModel alloc] initWithModel:report];
}


@end
