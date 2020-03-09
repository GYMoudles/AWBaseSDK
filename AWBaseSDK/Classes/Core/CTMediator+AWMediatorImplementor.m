//
//  CTMediator+AWMediatorImplementor.m
//  Pods
//
//  Created by zgy on 2020/3/4.
//

#import "CTMediator+AWMediatorImplementor.h"

@implementation CTMediator (AWMediatorImplementor)

- (UIViewController *)awPerformTarget:(NSString *)targetName action:(NSString * _Nullable)actionName params:(NSDictionary * _Nullable)params shouldCacheTarget:(BOOL)shouldCacheTarget
{
    UIViewController *vc = [self performTarget:targetName action:actionName params:params shouldCacheTarget:shouldCacheTarget];
    if ([vc isKindOfClass:[UIViewController class]]) {
        return vc;
    }else {
        NSLog(@"404, T:%@, A:%@, P:%@", targetName, actionName, params);
        AWBaseViewController *vc = [AWBaseViewController new];
        vc.title = @"未匹配的页面";
        return vc;
    }
    
}
@end
