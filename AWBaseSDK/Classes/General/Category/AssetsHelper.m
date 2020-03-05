//
//  Assets+AWBase.m
//  Pods
//
//  Created by zgy on 2020/3/4.
//

#import "AssetsHelper.h"

@implementation NSBundle (AWBase)


+ (NSBundle *)awBundleForClass:(Class)cls bundleName:(NSString *)name
{
//    NSBundle *bundle = [NSBundle bundleForClass:cls];
//    NSURL *url = [bundle URLForResource:name withExtension:@"bundle"];
//    return [self bundleWithURL:url];
    
    NSBundle *mainBundle = [NSBundle bundleForClass:cls];
    NSBundle *resourcesBundle = [NSBundle bundleWithPath:[mainBundle pathForResource:name ofType:@"bundle"]];
    if (nil != resourcesBundle) {
        mainBundle = resourcesBundle;
    }
    return mainBundle;
}

@end


@implementation UIImage (AWBase)

+ (UIImage *)awImageName:(NSString *)imageName forClass:(Class)cls bundleName:(NSString *)bundleName
{
    NSBundle *bundle = [NSBundle awBundleForClass:cls bundleName:bundleName];
    return [UIImage imageNamed:imageName inBundle:bundle compatibleWithTraitCollection:nil];
}


@end
