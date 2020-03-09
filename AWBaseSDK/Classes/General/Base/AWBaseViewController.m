//
//  AWBaseViewController.m
//  Awesome
//
//  Created by mac on 2019/1/16.
//  Copyright © 2019 zgy. All rights reserved.
//

/**
 使用RTRootNavigationController时，要使用BaseViewContrller 统一定制导航
 
 */
#import "AWBaseViewController.h"
#import "UIImage+JKColor.h"


#define kAWNavBackImgName @"navigationbar_back"
//#define kAWBackIndicatorImage @"navi_back"

@interface AWBaseViewController ()

@end

@implementation AWBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    UINavigationBar *navBar = self.navigationController.navigationBar;
    
    // 这里定制统一的导航样式
    NSDictionary *dict = @{NSForegroundColorAttributeName : [UIColor blackColor]};
   
    navBar.barTintColor = [UIColor whiteColor];
    navBar.tintColor = [UIColor blackColor];
    navBar.translucent = YES;
    [navBar setTitleTextAttributes:dict];
    
    // 改变导航栏细线颜色
    navBar.shadowImage = [UIImage jk_imageWithColor:kColorWithHex(0xE8E7E7)];
    
}

- (UIBarButtonItem *)rt_customBackItemWithTarget:(id)target action:(SEL)action
{
//    UIBarButtonItem *barBtnItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Back", nil)
//                                            style:UIBarButtonItemStylePlain
//                                           target:target
//                                           action:action];
    
    UIImage *backImg = [UIImage awImageName:kAWNavBackImgName forClass:[AWBaseViewController class] bundleName:kAWBaseSDKBundleName];
    UIBarButtonItem *barBtnItem = [[UIBarButtonItem alloc] initWithImage:backImg style:UIBarButtonItemStylePlain target:target action:action];
    
    return barBtnItem;
}




@end
