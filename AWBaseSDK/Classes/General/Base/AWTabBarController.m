//
//  AWTabBarController.m
//  Awesome
//
//  Created by 全名财富 on 2017/9/29.
//  Copyright © 2017年 zgy. All rights reserved.
//

#import "AWTabBarController.h"
#import "AWRootNavigationController.h"
#import "AWUserManager.h"



@interface AWTabBarController ()<UITabBarControllerDelegate>
{
    UIColor *_normalTextColor;
    UIColor *_selectedTextColor;
}
@end

@implementation AWTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupChildViewControllers];
    
}

- (void)setupChildViewControllers
{
    _normalTextColor = kRGBColor(123, 123, 123);
    _selectedTextColor = kColorWithHex(0x26ab28);
    
    
    UIViewController *vc0 = [AWBaseViewController new];
    [self setupChildVc:vc0 title:@"通讯录" image:@"tabbar_0" selectedImage:@"tabbar_0hl"];
    
    UIViewController *vc1 = [[CTMediator sharedInstance] awPerformTarget:@"1" action:@"" params:nil shouldCacheTarget:NO];
    [self setupChildVc:vc1 title:@"发现" image:@"tabbar_1" selectedImage:@"tabbar_1hl"];
    [vc1.view showEmptyView];
    
    UIViewController *vc2 = [[CTMediator sharedInstance] awPerformTarget:@"1" action:@"" params:nil shouldCacheTarget:NO];
    [self setupChildVc:vc2 title:@"我的" image:@"tabbar_2" selectedImage:@"tabbar_2hl"];
    
    NSArray *temp = @[vc0, vc1, vc2];
    
    
    NSMutableArray *navArr = @[].mutableCopy;
    for (UIViewController *v in temp) {
        AWRootNavigationController *nav = [[AWRootNavigationController alloc] initWithRootViewController:v];
        [navArr addObject:nav];
    }
    
    [self setViewControllers:navArr animated:NO];
    
    
    
    self.delegate = self;
    
    UITabBar.appearance.tintColor = _selectedTextColor;
    if (@available(iOS 10.0, *)) {
        UITabBar.appearance.unselectedItemTintColor = _normalTextColor;
    }
    
    
    // 去掉tabbar上方线
    //    self.tabBar.shadowImage = [UIImage jk_imageWithColor:kColorNaviLineGray];
    //    self.tabBar.backgroundImage = [UIImage jk_imageWithColor:[UIColor whiteColor]];
    
    //    [[UITabBarItem appearance] setTitlePositionAdjustment:UIOffsetMake(0, -2)];
}

- (void)resetChildViewControllers
{
    [self setViewControllers:nil animated:NO];
    [self setupChildViewControllers];
}


- (void)setSelectedIndex:(NSUInteger)selectedIndex
{
    BOOL flag = YES;
    //    if (selectedIndex == 1 || selectedIndex == 2 || selectedIndex == 4) {
    //        flag = [[AWUserManager sharedAWUserManager] isUserLogined];
    //        [[AppTools sharedTools] forceLoginAnimated:YES];
    //    }
    
    if (flag) {
        [super setSelectedIndex:selectedIndex];
    }
}

#pragma mark- UITabBarControllerDelegate
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
//    NSUInteger index = [tabBarController.viewControllers indexOfObject:viewController];
    BOOL flag = YES;
    //    if (index == 1 || index == 2 || index == 4) {
    //        flag = [[AWUserManager sharedAWUserManager] isUserLogined];
    //        [[AppTools sharedTools] forceLoginAnimated:YES];
    //    }

    
    //    UIViewController *thirdVC = [tabBarController.viewControllers objectAtIndex:2];
    //    if (viewController == thirdVC) {
    //        PublishViewController *vc = [PublishViewController new];
    //        AWNavigationController *nav = [[AWNavigationController alloc] initWithRootViewController:vc];
    //        [self presentViewController:nav animated:YES completion:nil];
    //        return NO;
    //    }
    return flag;
}


#pragma mark- Helper
- (void)setupChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    // 设置子控制器的文字
    childVc.title = title; // 同时设置tabbar和navigationBar的文字
    
    // 设置子控制器的图片
    childVc.tabBarItem.image = [UIImage awImageName:image forClass:[self class] bundleName:kAWBaseSDKBundleName];
    if (kSystemVersion >= 7.0) {
        childVc.tabBarItem.selectedImage = [[UIImage awImageName:selectedImage forClass:[self class] bundleName:kAWBaseSDKBundleName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    } else {
        childVc.tabBarItem.selectedImage = [UIImage awImageName:image forClass:[self class] bundleName:kAWBaseSDKBundleName];
    }
    
    // 设置文字的样式
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = _normalTextColor;
    NSMutableDictionary *selectTextAttrs = [NSMutableDictionary dictionary];
    selectTextAttrs[NSForegroundColorAttributeName] = _selectedTextColor;
    [childVc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [childVc.tabBarItem setTitleTextAttributes:selectTextAttrs forState:UIControlStateSelected];
    
}

@end
