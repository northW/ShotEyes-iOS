//
//  ReportDetailViewModel.m
//  ShotEyesiPAD
//
//  Created by kita on 14-5-18.
//  Copyright (c) 2014年 kita. All rights reserved.
//

#import "ReportDetailViewModel.h"
#import <SmartSDK/RestHelper.h>
#import "APIUrl.h"

@implementation ReportDetailViewModel

-(id)initWithReportId:(NSString *)_id
{
    self = [super init];
    self.model = [[DAReport alloc] init];
    
    self.fetchAPIPath = @"/Report/get";
    
    self.fetchFilter = @{@"reportId": _id};
    
    [[self fetchSignal] subscribeCompleted:^{
        
    }];
    
    return self;
}



-(NSString *)reportImageURLString
{
    NSString *path = [NSString stringWithFormat:kUrlPictureFetch,self.model.picture];
    return [NSString stringWithFormat:@"%@%@",[RestHelper getServerAddress],path];
}

@end
