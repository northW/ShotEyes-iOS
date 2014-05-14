//
//  ReportTableViewCell.h
//  ShotEyesiPAD
//
//  Created by kita on 14-5-13.
//  Copyright (c) 2014年 kita. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Entities.h"

@interface ReportTableViewCell : UITableViewCell
@property DAReport *model;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblSummary;

-(void)setModelWithReport:(DAReport *)model;
@end
