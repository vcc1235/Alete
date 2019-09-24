#
# Be sure to run `pod lib lint Alete.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Alete'
  s.version          = '0.1.0'
  s.summary          = 'A short description of Alete.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/1041497818@qq.com/Alete'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '1041497818@qq.com' => '1041497818@qq.com' }
  s.source           = { :git => 'https://github.com/1041497818@qq.com/Alete.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'
  s.dependency 'ReactiveObjC'
  s.dependency 'YYImage'
  s.dependency 'MJRefresh'
  s.dependency 'Masonry'
  
  s.source_files = 'Alete/Classes/Alete.h'
  
  path = 'Alete/Classes/Home/'
  
  s.subspec 'ConfigManager' do |ss|
    ss.source_files = path + 'ColorManager/*{.h,.m}'
  end
  
  s.subspec 'Parise' do |ss|
    ss.source_files = path + 'PariseManager/*{.h,.m}'
  end
  
  s.subspec 'Category' do |ss|
    ss.source_files = path + 'Category/**/**'
  end
  
  s.subspec 'Factory' do |ss|
    ss.source_files = path + 'Factory/**'
  end
  
  s.subspec 'Base' do |ss|
    ss.source_files = path + 'Base/**/**'
  end
  s.subspec 'Tool' do |ss|
    ss.source_files = path + 'Tool/**/**'
  end
  
  
  
  s.subspec 'Lib' do |ss|
    ss.subspec 'YYModel' do |sss|
      sss.source_files = path + 'Lib/YYModel/**'
    end
    ss.subspec 'SVProgressHUD' do |sss|
      sss.source_files = path + 'Lib/SVProgressHUD/*{.h,.m}'
      sss.resource = path+'Lib/SVProgressHUD/*.bundle'
    end
    ss.subspec 'UITableView+FDTemplateLayoutCell' do |sss|
      sss.source_files = path + 'Lib/UITableView+FDTemplateLayoutCell/*{.h,.m}'
    end
    ss.subspec 'SDCycleScrollView' do |sss|
      sss.source_files = path + 'Lib/SDCycleScrollView/*{.h,.m}'
      sss.source_files = path + 'Lib/SDCycleScrollView/**/**'
    end
    ss.subspec 'YYWebImage' do |sss|
      sss.source_files = path + 'Lib/YYWebImage/*{.h,.m}'
      sss.source_files = path + 'Lib/YYWebImage/**/**'
    end
    ss.subspec 'YYCache' do |sss|
      sss.source_files = path + 'Lib/YYCache/*{.h,.m}'
      sss.source_files = path + 'Lib/YYCache/**/**'
    end
    ss.subspec 'YYText' do |sss|
      sss.source_files = path + 'Lib/YYText/*{.h,.m}'
      sss.source_files = path + 'Lib/YYText/**/**'
    end
    ss.subspec 'RSA' do |sss|
      sss.source_files = path + 'Lib/RNCryptor/*{.h,.m}'
      sss.source_files = path + 'Lib/RNCryptor/**/**'
    end
    ss.subspec 'Alete' do |sss|
      sss.source_files = path + 'Lib/Alete/*{.h,.m}'
      sss.source_files = path + 'Lib/Alete/**/**'
    end
  end
  
  s.requires_arc = true
  s.xcconfig = {'OTHER_LDFLAGS' => '-ObjC'}
  # s.resource_bundles = {
  #   'Alete' => ['Alete/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
