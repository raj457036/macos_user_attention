#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint macos_user_attention.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'macos_user_attention'
  s.version          = '0.0.1'
  s.summary          = 'A Flutter Plugin for MacOS User Attention API'
  s.description      = <<-DESC
  A Flutter Plugin for MacOS User Attention API.
                       DESC
  s.homepage         = 'https://github.com/raj457036/macos_user_attention'
  s.license          = { :file => '../LICENSE' }
  s.author           = { '_' => 'rs457036@gmail.com' }

  s.source           = { :path => '.' }
  s.source_files     = 'Classes/**/*'
  s.dependency 'FlutterMacOS'

  s.platform = :osx, '10.11'
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
  s.swift_version = '5.0'
end
