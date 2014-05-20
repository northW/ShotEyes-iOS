//
//  ReportAddOrUpdateViewController.m
//  ShotEyesiPAD
//
//  Created by kita on 14-5-16.
//  Copyright (c) 2014年 kita. All rights reserved.
//

#import "ReportAddOrUpdateViewController.h"
#import <UIImageView+WebCache.h>


@interface ReportAddOrUpdateViewController ()

@end

@implementation ReportAddOrUpdateViewController

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
    
    @weakify(self);
    
    // bind title to view
    RAC(self.txtTitle, text) = [RACObserve(self.viewModel.model,title) distinctUntilChanged];

    [[self.txtTitle.rac_textSignal distinctUntilChanged] subscribeNext:^(NSString *x) {
        @strongify(self);
        self.viewModel.model.title = x;
    }];
    
    // bind summy to view
    RAC(self.txtSummary, text) = [RACObserve(self.viewModel.model,summary) distinctUntilChanged];
    
    [[self.txtSummary.rac_textSignal distinctUntilChanged] subscribeNext:^(NSString *x) {
        @strongify(self);
        self.viewModel.model.summary = x;
    }];
    
    
    [[RACObserve(self.imgPhoto, image) distinctUntilChanged]
    subscribeNext:^(UIImage* x) {
        @strongify(self);
        self.viewModel.imageViewModel.image = x;
    }];
    
    [[RACObserve(self.viewModel.model, picture) distinctUntilChanged] subscribeNext:^(id x) {
        @strongify(self);
        [self.viewModel.imageViewModel setImageInImageView:self.imgPhoto placeholderImage:nil];
    }];
    
    RAC(self.btnSave, enabled) = self.viewModel.modelIsValidSignal;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)selectPhoto:(id)sender {
    UIImagePickerController *ipc = [[UIImagePickerController alloc] init];
    
    ipc.delegate = self;
    ipc.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    ipc.allowsEditing = NO;
    
    // モーダルビューとしてカメラ画面を呼び出す
    [self presentViewController:ipc animated:YES completion:nil];
}

- (IBAction)saveReport:(id)sender {
    @weakify(self);
    [self.viewModel.imageViewModel upLoadImageCompleted:^{
        @strongify(self);
        
        [[self.viewModel saveSignal] subscribeCompleted:^{
            
            [self dismissViewControllerAnimated:YES completion:nil];
        }];
    }];
    
    
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    self.imgPhoto.image = image;
    
//    self.viewModel.imageViewModel.image = image;
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    
}

@end
