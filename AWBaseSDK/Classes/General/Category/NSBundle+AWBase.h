//
//  NSBundle+AWBase.h
//  Pods
//
//  Created by zgy on 2020/3/4.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSBundle (AWBase)

+ (NSBundle *)awBundleForClass:(Class)cls bundleName:(NSString *)name;


@end

NS_ASSUME_NONNULL_END
