//
//  ReportAddOrUpdateViewModel.m
//  ShotEyesiPAD
//
//  Created by kita on 14-5-16.
//  Copyright (c) 2014年 kita. All rights reserved.
//

#import "ReportAddOrUpdateViewModel.h"
#import <SmartSDK/RestHelper.h>
#import "APIUrl.h"

@implementation ReportAddOrUpdateViewModel
-(id)initWithModel:(id)model
{
    self = [super initWithModel:model];
    
    self.createAPIPath = kUrlReportAdd;
    self.updateAPIPath = kUrlReportUpdate;
    if (self.model._id) {
        self.updateFilter = @{@"_id":self.model._id};
        self.imageViewModel = [[ImageViewModel alloc] initWithFetchPath:@"/Picture/fetch" fileId:self.model.picture];
    } else {// to create
        self.category = [[DACategory alloc] init];
        self.imageViewModel = [[ImageViewModel alloc] init];
    }
    
    self.imageViewModel.uploadPath = @"/Picture/upload";
    
    
    //    RAC(self.model, category) = RACObserve(self.category, _id);
    
    @weakify(self);
    [RACObserve(self, category) subscribeNext:^(id x) {
        @strongify(self);
        if (self.category._id) {
            self.model.category = self.category._id;
        }
        
    }];
    [RACObserve(self.imageViewModel, model) subscribeNext:^(id x) {
        @strongify(self);
        self.model.picture = self.imageViewModel.model._id;
    }];
    
    
    return self;
}

-(id)initWithModel:(id)model category:(DACategory *)category
{
    self = [self initWithModel:model];
    self.category = category;
    
    return self;
}


-(RACSignal *)modelIsValidSignal
{
//    @weakify(self);
    return [RACSignal combineLatest:@[RACObserve(self.model, title), RACObserve(self.model, summary), RACObserve(self.imageViewModel, image)] reduce:^id(NSString *title, NSString *summary, UIImage *image){
//        @strongify(self);
        return @((title.length > 0) && (summary.length > 0) && (image != nil));
    }];
}

@end
