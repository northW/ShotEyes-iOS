//
//  ReportDetailViewModel.h
//  ShotEyesiPAD
//
//  Created by kita on 14-5-18.
//  Copyright (c) 2014年 kita. All rights reserved.
//

#import <SmartSDK/BaseViewModel.h>
#import "Entities.h"

@interface ReportDetailViewModel : BaseViewModel
@property(retain,nonatomic) DAReport *model;

-(id)initWithReportId:(NSString *)_id;
-(NSString *)reportImageURLString;
@end
