//
//  CategoryAddViewController.h
//  ShotEyesiPAD
//
//  Created by kita on 14-5-14.
//  Copyright (c) 2014年 kita. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CategoryAddViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *txtCategoryName;
@property (weak, nonatomic) IBOutlet UIButton *btnSave;
- (IBAction)clickedSave:(id)sender;

@end
