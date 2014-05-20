//
//  ImageViewModel.m
//  ShotEyesiPAD
//
//  Created by kita on 14-5-16.
//  Copyright (c) 2014年 kita. All rights reserved.
//

#import "ImageViewModel.h"
#import <SmartSDK/RestHTTPRequestManager.h>
#import <SmartSDK/RestHelper.h>
#import <UIImageView+WebCache.h>
@implementation DAFile
@end

@interface ImageViewModel()
@property RestHTTPRequestManager* requestManager;
@end

typedef id(^RACSignalErrorBlock)(NSError*);

@implementation ImageViewModel
-(id)init
{
    self = [super init];
    self.requestManager = [RestHTTPRequestManager sharedManager];
    
    return self;
}

-(id)initWithFetchPath:(NSString *)fetchPath
{
    self = [self init];
    self.fetchPath = fetchPath;
    return self;
}

-(id)initWithFetchPath:(NSString *)fetchPath fileId:(NSString *)_id
{
    self = [self initWithFetchPath:fetchPath];
    self.model = [[DAFile alloc] initWithDictionary:@{@"_id": _id}];
    
    return self;
}

-(id)initAndFetchImageWithFetchPath:(NSString *)fetchPath fileId:(NSString *)_id
{
    self = [self initAndFetchImageWithFetchPath:fetchPath fileId:_id];
    
    [[self fetchImage] subscribeCompleted:^{
        
    }];
    
    return self;
}

- (RACSignalErrorBlock)errorBlock {
    //    @weakify(self);
    return ^(NSError* error) {
        //        @strongify(self);
        NSLog(@"%@",error);
        return [RACSignal empty];
    };
}

-(RACSignal *)fetchImage
{
    NSDictionary *params = @{@"fileInfoId": self.model._id};
    RACSignal *sig = [[self.requestManager fethImage:self.fetchPath parameters:params] map:^id(UIImage *value) {
        self.image = value;
        return value;
    }];
    
    return sig;
}


#warning 临时方法，今后替换成RAC的实现
-(void)upLoadImageCompleted:(void (^)(void))completed
{
    NSData *imageData = UIImageJPEGRepresentation(self.image, 0.5);
    self.requestManager.requestSerializer = [AFHTTPRequestSerializer serializer];
    self.requestManager.responseSerializer = [AFJSONResponseSerializer serializer];
    [self.requestManager POST:@"/Picture/upload" parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        [formData appendPartWithFileData:imageData name:@"files" fileName:@"photo.jpg" mimeType:@"image/jpeg"];
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *data =[responseObject valueForKeyPath:@"data"];
        
        self.model = [[DAFile alloc] initWithDictionary:data];
        
        if (completed) {
            completed();
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Failure %@, %@", error, operation.responseString);
    }];
    
    
//    [op start];
}

-(void)setImageInImageView:(UIImageView *)imageView placeholderImage:(UIImage *)image
{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@/Picture/fetch?fileInfoId=%@",[RestHelper getServerAddress],self.model._id]];
    [imageView setImageWithURL:url placeholderImage:image options:SDWebImageHandleCookies completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType) {
        self.image = image;
    }];
}

@end
