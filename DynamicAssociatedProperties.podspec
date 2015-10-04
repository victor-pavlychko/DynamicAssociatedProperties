#
# Be sure to run `pod lib lint DynamicAssociatedProperties.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "DynamicAssociatedProperties"
  s.version          = "0.1.0"
  s.summary          = "NSObject category to dynamically implement category properties usning objc_setAssociatedObject."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
#  s.description      = <<-DESC
#                       DESC

  s.homepage         = "https://github.com/victor-pavlychko/DynamicAssociatedProperties"
  s.license          = 'MIT'
  s.author           = { "Victor Pavlychko" => "victor.pavlychko@gmail.com" }
  s.source           = { :git => "https://github.com/victor-pavlychko/DynamicAssociatedProperties.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/victorpavlychko'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.public_header_files = 'Pod/Classes/NSObject+DynamicAssociatedProperties.h'

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
