//
//  AWNetManager.h
//  AWBaseSDK
//
//  Created by zgy on 2020/3/3.
//  YD网关请求封装

#import <Foundation/Foundation.h>
#import <XMNetworking/XMNetworking.h>

NS_ASSUME_NONNULL_BEGIN


typedef void (^AWProgressBlock)(NSProgress *progress);
typedef void (^AWSuccessBlock)(id _Nullable responseObject);
typedef void (^AWFailureBlock)(NSError * _Nullable error);
typedef void (^AWFinishedBlock)(id _Nullable responseObject, NSError * _Nullable error);
typedef void (^AWCancelBlock)(id _Nullable request);

@interface AWNetManager : NSObject




+ (NSString *)get:(NSDictionary *)param onSuccess:(AWSuccessBlock)success onFailure:(AWFailureBlock)failure;

+ (NSString *)post:(NSDictionary *)param onSuccess:(AWSuccessBlock)success onFailure:(AWFailureBlock)failure;



@end

NS_ASSUME_NONNULL_END
