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
  s.summary          = "Automatically implement @dynamic property accessors usning objc_setAssociatedObject."
  s.description      = <<-DESC
DynamicAssociatedProperties library automatically generates accessors for @dynamic properties
defined in categories using objc_getAssociatedObject/objc_setAssociatedObject for backing storage.
Library objects, standard numeric types, custom structs, several UIKit structs, strong/copy/weak/assign
policies and custom accessor name specifications.
                         DESC

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
