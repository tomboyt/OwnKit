#
# Be sure to run `pod lib lint OwnKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#
class MyCode
def recursionDirCreateSubSpace(path1,space)
    ignore = ['.','..','.DS_Store']
 
    Dir.foreach(path1) do |file|
        
        # p file  # 打印所有的file，需要忽略掉你不需要的
        if ignore.include?(file) && file.length > 0
            next
        end
        
        tmpPath = "#{path1}/#{file}"
        # p tmpPath # 打印合理的路径，检测是否有不合理的记得过滤
        if File::ftype(tmpPath) == "directory"
            space.subspec file do |tmpS|
                tmpS.source_files = "#{tmpPath}/*"
                recursionDirCreateSubSpace(tmpPath,tmpS)
            end
        end
    end
end

Pod::Spec.new do |s|
  s.name             = 'OwnKit'
  s.version          = '0.0.5'
  s.summary          = 'OwnKit.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/tomboyt/OwnKit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'tomboyt' => 'tomboyt@163.com' }
  s.source           = { :git => 'https://github.com/tomboyt/OwnKit.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
  s.platform         = :ios, '9.0'
  #s.ios.deployment_target = '9.0'
  s.swift_versions   = '5.0'
  s.source_files = 'OwnKit/Classes/*'
 
  s.pod_target_xcconfig = { 'VALID_ARCHS' => 'x86_64 armv7 arm64' }
  # s.resource_bundles = {
  #   'OwnKit' => ['OwnKit/Assets/*.png']
  # }
#  s.subspec "lib" do |ss|
#      ss.source_files = 'OwnKit/Classes/lib/*'
#      end
#  s.subspec "newKit" do |ss|
#      ss.source_files = 'OwnKit/Classes/newKit/*'
#      end
  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  MyCode.new.recursionDirCreateSubSpace("OwnKit/Classes",s)
      end
end
