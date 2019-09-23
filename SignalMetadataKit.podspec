#
# Be sure to run `pod lib lint SignalMetadataKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "SignalMetadataKit"
  s.version          = "1.0.0"
  s.summary          = "A Swift & Objective-C library used by other Signal libraries."

  s.description      = <<-DESC
A Swift & Objective-C library used by other Signal libraries.
  DESC

  s.homepage         = "https://github.com/signalapp/SignalMetadataKit"
  s.license          = 'GPLv3'
  s.author           = { "iOS Team" => "ios@signal.org" }
  s.source           = { :git => "https://github.com/signalapp/SignalMetadataKit.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/signalapp'

  s.platform     = :ios, '10.0'
  s.requires_arc = true

  s.source_files  = 'SignalMetadataKit/src/**/*.{h,m,mm,swift}', 'SignalMetadataKit/Private/**/*.{h,m,mm,swift}'

  s.public_header_files = 'SignalMetadataKit/src/**/*.h'

  # We want to use modules to avoid clobbering CocoaLumberjack macros defined
  # by other OWS modules which *also* import CocoaLumberjack. But because we
  # also use Objective-C++, modules are disabled unless we explicitly enable
  # them
  s.compiler_flags = "-fcxx-modules"

  s.prefix_header_file = 'SignalMetadataKit/SMKPrefix.h'
  s.xcconfig = { 'OTHER_CFLAGS' => '$(inherited) -DSQLITE_HAS_CODEC' }

  s.resources = ["SignalMetadataKit/Resources/Certificates/*"]

  s.dependency 'AxolotlKit'
  s.dependency 'CocoaLumberjack'
  s.dependency 'Curve25519Kit'
  s.dependency 'HKDFKit'
  s.dependency 'SignalCoreKit'
  s.dependency 'SwiftProtobuf'

  s.test_spec 'Tests' do |test_spec|
    test_spec.source_files = 'SignalMetadataKitTests/src/**/*.{h,m,swift}'
  end
end
