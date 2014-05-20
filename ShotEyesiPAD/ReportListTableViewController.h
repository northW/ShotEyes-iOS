//
//  ReportListTableViewController.h
//  ShotEyesiPAD
//
//  Created by kita on 14-5-13.
//  Copyright (c) 2014年 kita. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SmartSDK/BaseTableViewController.h>
#import "Entities.h"

@interface ReportListTableViewController : BaseTableViewController
-(void) setModelWithCategroy:(DACategory *)categroy;
@end
