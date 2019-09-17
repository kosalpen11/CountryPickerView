#
#  Be sure to run `pod spec lint SPCountryPikcerView.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "SPCountryPikcerView"
  s.version      = "0.0.10"
  s.summary      = "A CocoaPods library written in Swift"
  s.description  = <<-DESC
This CocoaPods library helps you perform calculation.
                   DESC
  s.homepage     = "https://github.com/kosalpen11/CountryPickerView"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "kosalpen11" => "kosalpen11@gmail.com" }	
  s.source        = { :git => "https://github.com/kosalpen11/CountryPickerView.git", :tag => "#{spec.version}" }
  s.source_files  = "SPCountryPikcerView/**/*.swift"
  s.platform = :ios
  s.ios.deployment_target = "12.0"
  s.swift_version = "4.2"

end
