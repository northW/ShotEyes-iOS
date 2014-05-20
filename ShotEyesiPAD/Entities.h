
#import "SmartSDK.h"

@interface DAReport : DAEntity
@property (retain, nonatomic) NSString *_id;
@property (retain, nonatomic) NSString *valid;
@property (retain, nonatomic) NSString *createAt;
@property (retain, nonatomic) NSString *createBy;
@property (retain, nonatomic) NSString *updateAt;
@property (retain, nonatomic) NSString *updateBy;
@property (retain, nonatomic) NSString *title;
@property (retain, nonatomic) NSString *summary;
@property (retain, nonatomic) NSString *category;
@property (retain, nonatomic) NSString *picture;

@end

@interface DACategory : DAEntity
@property (retain, nonatomic) NSString *_id;
@property (retain, nonatomic) NSString *valid;
@property (retain, nonatomic) NSString *createAt;
@property (retain, nonatomic) NSString *createBy;
@property (retain, nonatomic) NSString *updateAt;
@property (retain, nonatomic) NSString *updateBy;
@property (retain, nonatomic) NSString *name;

@end

