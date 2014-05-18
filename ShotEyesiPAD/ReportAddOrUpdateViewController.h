//
//  ReportAddOrUpdateViewController.h
//  ShotEyesiPAD
//
//  Created by kita on 14-5-16.
//  Copyright (c) 2014年 kita. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ReportAddOrUpdateViewModel.h"

@interface ReportAddOrUpdateViewController : UIViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property ReportAddOrUpdateViewModel *viewModel;
@property (weak, nonatomic) IBOutlet UITextField *txtTitle;
@property (weak, nonatomic) IBOutlet UITextField *txtSummary;
@property (weak, nonatomic) IBOutlet UIImageView *imgPhoto;
@property (weak, nonatomic) IBOutlet UIButton *btnSave;
- (IBAction)selectPhoto:(id)sender;
- (IBAction)saveReport:(id)sender;


@end
