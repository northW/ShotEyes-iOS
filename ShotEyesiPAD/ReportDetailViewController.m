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
    
    [[RACObserve(self.viewModel, model) distinctUntilChanged] subscribeNext:^(id x) {
        @strongify(self);
//        [self.imgPhoto setImageWithURL:[NSURL URLWithString:[self.viewModel reportImageURLString]]];
        
        DAReport *report = x;
        
        self.txtTitle.text = report.title;
        self.txtSummary.text = report.summary;
        
    }];
    
    [[RACObserve(self.imageViewModel, image) distinctUntilChanged] subscribeNext:^(id x) {
        @strongify(self);
        //        [self.imgPhoto setImageWithURL:[NSURL URLWithString:[self.viewModel reportImageURLString]]];
        
        self.imgPhoto.image = x;
        
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
        ReportAddOrUpdateViewModel *vm = [[ReportAddOrUpdateViewModel alloc] initWithModel:self.viewModel.model];
//        vm.model = self.viewModel.model;
//        vm.category = self.viewModel.category;
        [(ReportAddOrUpdateViewController *)segue.destinationViewController setViewModel:vm];
    }
}

-(void)setModelWithReport:(DAReport *)report
{
    self.viewModel = [[BaseViewModel alloc] initWithModel:report];
    self.imageViewModel = [[ImageViewModel alloc] initAndFetchImageWithFetchPath:@"/Picture/fetch" fileId:report.picture];
}


@end
