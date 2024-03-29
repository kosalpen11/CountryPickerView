#
#  Be sure to run `pod spec lint SPCountryPikcerView.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  spec.name         = "SPCountryPikcerView"
  spec.version      = "0.0.15"
  spec.summary      = "A CocoaPods library written in Swift"

  spec.description  = <<-DESC
This CocoaPods library helps you perform calculation.
                   DESC

  spec.homepage     = "https://github.com/kosalpen11/CountryPickerView"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "kosalpen11" => "kosalpen11@gmail.com" }	

  spec.ios.deployment_target = "12.1"
  spec.swift_version = "4.2"

  spec.resource_bundles = { 'SPCountryPikcerView' => ['SPCountryPikcerView/**/*']}
  spec.source        = { :git => "https://github.com/kosalpen11/CountryPickerView.git", :tag => "#{spec.version}" }
  spec.resources  = "SPCountryPikcerView/**/*.{h,m,swift,json}"

end
