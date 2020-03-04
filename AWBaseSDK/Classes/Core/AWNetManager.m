//
//  AWNetManager.m
//  AWBaseSDK
//
//  Created by zgy on 2020/3/3.
//

#import "AWNetManager.h"

@implementation AWNetManager

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
