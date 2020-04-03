//
//  AWEmptyView.m
//  Pods
//
//  Created by zgy on 2020/4/2.
//

#import "AWEmptyView.h"

@implementation AWEmptyView

+ (instancetype)emptyView
{
    NSBundle *bd = [NSBundle awBundleForClass:[self class] bundleName:kAWBaseSDKBundleName];
    NSArray *arr = [bd loadNibNamed:NSStringFromClass(self) owner:nil options:nil];
    return [arr lastObject];
}
@end
