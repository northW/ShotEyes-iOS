//
//  ReportAddOrUpdateViewModel.m
//  ShotEyesiPAD
//
//  Created by kita on 14-5-16.
//  Copyright (c) 2014年 kita. All rights reserved.
//

#import "ReportAddOrUpdateViewModel.h"

@implementation ReportAddOrUpdateViewModel
-(id)init
{
    self = [super init];
    self.model = [[DAReport alloc] init];
    self.category = [[DACategory alloc] init];
    self.imageViewModel = [[ImageViewModel alloc] init];
    
    self.createAPIPath = @"/Report/add";
    
//    RAC(self.model, category) = RACObserve(self.category, _id);
    
    @weakify(self);
    [RACObserve(self, category) subscribeNext:^(id x) {
        @strongify(self);
        self.model.category = self.category._id;
    }];
    [RACObserve(self.imageViewModel, model) subscribeNext:^(id x) {
        @strongify(self);
        self.model.picture = self.imageViewModel.model._id;
    }];
    
    
    return self;
}


-(RACSignal *)modelIsValidSignal
{
    @weakify(self);
    return [RACSignal combineLatest:@[RACObserve(self.model, title), RACObserve(self.model, summary), RACObserve(self.imageViewModel, image)] reduce:^id(NSString *title, NSString *summary, UIImage *image){
        @strongify(self);
        return @((title.length > 0) && (summary.length > 0) && (image != nil));
    }];
}
@end
