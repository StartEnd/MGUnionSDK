#
# Be sure to run `pod lib lint MGUnionSDK.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MGUnionSDK'
  s.version          = '0.3.0'
  s.summary          = '微游戏SDK'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/StartEnd/MGUnionSDK'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'StartEnd' => '996982027@qq.com' }
  s.source           = { :git => 'https://github.com/StartEnd/MGUnionSDK.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'
  
  # 依赖的自己的Framework
  s.vendored_frameworks = 'MGUnionSDK/MGUnionSDK.framework'
  s.resources = 'MGUnionSDK/MGUnionSDKReso.bundle'

  #s.source_files = 'MGUnionSDK/Classes/**/*'
  
  # s.resource_bundles = {
  #   'MGUnionSDK' => ['MGUnionSDK/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  
  s.static_framework  =  true
  
  s.dependency 'Masonry'
  s.dependency 'WechatOpenSDK'
  s.dependency "Weibo_SDK"
  s.dependency 'SVProgressHUD'
end
