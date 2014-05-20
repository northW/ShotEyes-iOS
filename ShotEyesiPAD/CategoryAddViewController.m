//
//  CategoryAddViewController.m
//  ShotEyesiPAD
//
//  Created by kita on 14-5-14.
//  Copyright (c) 2014年 kita. All rights reserved.
//

#import "CategoryAddViewController.h"
#import "BaseViewModel.h"
#import "Entities.h"

@interface CategoryAddViewController ()
@property BaseViewModel * viewModel;
@end

@implementation CategoryAddViewController

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
    self.viewModel = [[BaseViewModel alloc] initWithModel:[[DACategory alloc] init]];
    self.viewModel.createAPIPath = @"/Category/add";
    @weakify(self);
    [[self.txtCategoryName.rac_textSignal distinctUntilChanged] subscribeNext:^(id x) {
        @strongify(self);
        ((DACategory*)self.viewModel.model).name = self.txtCategoryName.text;
    }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


- (IBAction)clickedSave:(id)sender {
    [[self.viewModel createSignal] subscribeCompleted:^{
        [self dismissViewControllerAnimated:YES completion:^{
            
        }];
    }];
}
@end
