//
//  ReportTableViewCell.m
//  ShotEyesiPAD
//
//  Created by kita on 14-5-13.
//  Copyright (c) 2014年 kita. All rights reserved.
//

#import "ReportTableViewCell.h"

@implementation ReportTableViewCell

-(void)setModelWithReport:(DAReport *)model
{
    self.model = model;
    
    self.lblTitle.text = model.title;
    self.lblSummary.text = model.summary;
}

@end
