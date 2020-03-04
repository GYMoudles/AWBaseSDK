//
//  AWNetManager.m
//  AWBaseSDK
//
//  Created by zgy on 2020/3/3.
//

#import "AWNetManager.h"

@implementation AWNetManager


//static AWNetManager *_instance;
//
//+ (id)allocWithZone:(struct _NSZone *)zone
//{
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        _instance = [super allocWithZone:zone];
//    });
//    return _instance;
//}
//
//+ (instancetype)sharedManager
//{
//    if (_instance == nil) {
//        _instance = [[AWNetManager alloc] init];
//    }
//    return _instance;
//}



+ (void)setupConfig:(void(^)(XMConfig *config))block {
    [XMCenter setupConfig:block];
    
//    [XMCenter setupConfig:^(XMConfig *config) {
//        config.generalServer = @"general server address";
//        config.generalHeaders = @{@"general-header": @"general header value"};
//        config.generalParameters = @{@"general-parameter": @"general parameter value"};
//        config.generalUserInfo = nil;
//        config.callbackQueue = dispatch_get_main_queue();
//        config.engine = [XMEngine sharedEngine];
//    #ifdef DEBUG
//        config.consoleLog = YES;
//    #endif
//    }];
}


+ (NSString *)get:(NSDictionary *)param onSuccess:(AWSuccessBlock)success onFailure:(AWFailureBlock)failure
{
    return [XMCenter sendRequest:^(XMRequest * _Nonnull request) {
//        request.url = @"http://example.com/v1/foo/bar";
        request.httpMethod = kXMHTTPMethodGET;
    } onSuccess:^(id  _Nullable responseObject) {
        success(responseObject);
    } onFailure:^(NSError * _Nullable error) {
        failure(error);
    }];
}

+ (NSString *)post:(NSDictionary *)param onSuccess:(AWSuccessBlock)success onFailure:(AWFailureBlock)failure
{
    return [XMCenter sendRequest:^(XMRequest * _Nonnull request) {
    //        request.url = @"http://example.com/v1/foo/bar";
            request.httpMethod = kXMHTTPMethodPOST;
        } onSuccess:^(id  _Nullable responseObject) {
            success(responseObject);
        } onFailure:^(NSError * _Nullable error) {
            failure(error);
        }];
}



@end
