#
# Be sure to run `pod lib lint AWBaseSDK.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

rootCodeDir = 'AWBaseSDK/Classes'
Pod::Spec.new do |s|
  s.name             = 'AWBaseSDK'
  s.version          = '0.1.0'
  s.summary          = 'AwesomTemplate 模板项目，支持模块化'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
AwesomTemplate 模板项目 为了支持模块化，做成Base模块
                       DESC

  s.homepage         = 'https://github.com/GYMoudles/AWBaseSDK'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'zgy' => '173678978@qq.com' }
  s.source           = { :git => 'https://github.com/GYMoudles/AWBaseSDK.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'
  
  s.prefix_header_contents = <<-EOS
   #ifdef __OBJC__
   #import <UIKit/UIKit.h>
   #import "CommonHeader.h"
   #define kAWBaseSDKBundleName @"AWBaseSDK"
   #else
   #ifndef FOUNDATION_EXPORT
   #if defined(__cplusplus)
   #define FOUNDATION_EXPORT extern "C"
   #else
   #define FOUNDATION_EXPORT extern
   #endif
   #endif
   #endif
  EOS



  # s.source_files = 'AWBaseSDK/Classes/**/*'
  s.subspec 'Core' do |ss|
    ss.source_files = rootCodeDir + '/Core/*'
  end
  
  s.subspec 'General' do |ss|

        ss.subspec 'Base' do |sss|
            sss.source_files = rootCodeDir + '/General/Base/*'
            sss.exclude_files = rootCodeDir + '/General/Base/AWNavigationController.{h,m}' 
        end
        ss.subspec 'Helper' do |sss|
            sss.source_files = rootCodeDir + '/General/Helper/*'
        end
        ss.subspec 'Marco' do |sss|
            sss.source_files = rootCodeDir + '/General/Marco/*'
        end
        ss.subspec 'Category' do |sss|
            sss.source_files = rootCodeDir + '/General/Category/*'
                sss.subspec 'NSDate' do |ssss|
                    ssss.source_files = rootCodeDir + '/General/Category/NSDate/*'
                end
                sss.subspec 'HYBUnicodeReadable' do |ssss|
                    ssss.source_files = rootCodeDir + '/General/Category/HYBUnicodeReadable/*'
                    ssss.exclude_files = rootCodeDir + '/General/Category/HYBUnicodeReadable/NSObject+HYBUnicodeReadable.{h,m}'
                end
        end
  end
  
  s.subspec 'Model' do |ss|
      ss.source_files = rootCodeDir + '/Model/*'
  end
  
  s.subspec 'Vendors' do |ss|
      ss.subspec 'AvoidCrash' do |sss|
          sss.source_files = rootCodeDir + '/Vendors/AvoidCrash/**/*'
          
          sss.subspec 'no-arc' do |mrc|
              mrc.source_files = rootCodeDir + '/Vendors/AvoidCrash/NSMutableArray+AvoidCrash.m'
              mrc.requires_arc = false
          end
      end
      ss.subspec 'MBProgressHUD' do |sss|
          sss.source_files = rootCodeDir + '/Vendors/MBProgressHUD/*'
          sss.resource_bundles = {
              'MBProgressHUD' => [rootCodeDir + '/Vendors/MBProgressHUD/*.bundle']
          }
      end
      ss.subspec 'QMUIKit_Lite' do |sss|
          sss.source_files = rootCodeDir + '/Vendors/QMUIKit_Lite/**/*'
      end
      ss.subspec 'Reachability' do |sss|
          sss.source_files = rootCodeDir + '/Vendors/Reachability/**/*'
      end
      
      ss.subspec 'TOSearchBar' do |sss|
          sss.source_files = rootCodeDir + '/Vendors/TOSearchBar/*'
          sss.resource_bundles = {
              'TOSearchBar' => [rootCodeDir + '/Vendors/TOSearchBar/*.lproj/*']
          }
      end
      ss.subspec 'XCFileManager' do |sss|
          sss.source_files = rootCodeDir + '/Vendors/XCFileManager/**/*'
      end
      ss.subspec 'YYKit' do |sss|
          sss.source_files = rootCodeDir + '/Vendors/YYKit/**/*'
      end
      
      ss.subspec 'CTMediator' do |sss|
          sss.source_files = rootCodeDir + '/Vendors/CTMediator/*'
      end
     
  end
  
  
  
  
  
  
  s.resource_bundles = {
    'AWBaseSDK' => ['AWBaseSDK/Assets/*.xcassets', rootCodeDir + '/**/*.xib']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  s.dependency 'AFNetworking'
  s.dependency 'XMNetworking'
  s.dependency 'GYIntroductionView'
  s.dependency 'IQKeyboardManager'
  s.dependency 'Masonry'
  s.dependency 'MJExtension'
  s.dependency 'MJRefresh'
  s.dependency 'RJBadgeKit'
  s.dependency 'RTRootNavigationController'
  s.dependency 'SDWebImage'
  s.dependency 'FDFullscreenPopGesture'
  
end
