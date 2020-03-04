//
//  CTMediator+AWMediatorImplementor.h
//  Pods
//
//  Created by zgy on 2020/3/4.
//


#import "CTMediator.h"

NS_ASSUME_NONNULL_BEGIN

@interface CTMediator (AWMediatorImplementor)


- (UIViewController *)awPerformTarget:(NSString *)targetName action:(NSString * _Nullable)actionName params:(NSDictionary * _Nullable)params shouldCacheTarget:(BOOL)shouldCacheTarget;


@end

NS_ASSUME_NONNULL_END
