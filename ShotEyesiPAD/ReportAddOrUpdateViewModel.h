//
//  ReportAddOrUpdateViewModel.h
//  ShotEyesiPAD
//
//  Created by kita on 14-5-16.
//  Copyright (c) 2014年 kita. All rights reserved.
//

#import <SmartSDK/BaseViewModel.h>
#import <SmartSDK/ImageViewModel.h>
#import "Entities.h"

@interface ReportAddOrUpdateViewModel : BaseViewModel
@property(retain, nonatomic)DACategory *category;
@property(retain,nonatomic)DAReport *model;
@property(retain,nonatomic)ImageViewModel *imageViewModel;
-(NSString *)reportImageURLString;
-(RACSignal *)modelIsValidSignal;
@end
