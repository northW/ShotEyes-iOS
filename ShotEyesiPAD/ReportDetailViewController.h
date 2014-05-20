//
//  ReportDetailViewController.h
//  ShotEyesiPAD
//
//  Created by kita on 14-5-18.
//  Copyright (c) 2014年 kita. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ReportAddOrUpdateViewModel.h"
#import "Entities.h"

@interface ReportDetailViewController : UIViewController
@property (retain, nonatomic) ReportAddOrUpdateViewModel *viewModel;

@property (weak, nonatomic) IBOutlet UILabel *txtTitle;
@property (weak, nonatomic) IBOutlet UITextView *txtSummary;
@property (weak, nonatomic) IBOutlet UIImageView *imgPhoto;
-(void)setModelWithReport:(DAReport *)report category:(DACategory *)category;
@end
