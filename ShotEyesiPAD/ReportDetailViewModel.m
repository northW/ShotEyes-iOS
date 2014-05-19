//
//  ReportDetailViewModel.m
//  ShotEyesiPAD
//
//  Created by kita on 14-5-18.
//  Copyright (c) 2014年 kita. All rights reserved.
//

#import "ReportDetailViewModel.h"
#import <RestHelper.h>

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

//-(id)initWithModel:(DAReport *)model
//{
//    self = [super initWithModel:model];
//    
//    
//    
//    return self;
//}



-(NSString *)reportImageURLString
{
    return [NSString stringWithFormat:@"%@/Picture/fetch?fileInfoId=%@",[RestHelper getServerAddress],self.model.picture];
}

@end
