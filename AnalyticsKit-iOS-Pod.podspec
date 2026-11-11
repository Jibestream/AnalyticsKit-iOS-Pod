Pod::Spec.new do |s|
s.name             = 'AnalyticsKit-iOS-Pod'
s.version='3.0.0'
s.summary          = 'The AnalyticsKit-iOS-Pod for the Jibestream iOS SDK.'

s.description      = 'This CocoaPod provides the release version of the AnalyticsKit for the Jibestream iOS SDK.'

s.homepage         = 'http://www.jibestream.com/'
s.author           = { 'louieyune' => 'lyuen@jibestream.com' }
s.source           = { :git => 'https://github.com/Jibestream/AnalyticsKit-iOS-Pod', :tag => "#{s.version}" }

s.dependency "JMapiOSSDK", "~> 6.0"
s.platform = :ios, '15.0'
s.vendored_frameworks = 'AnalyticsKit-iOS-Pod/Frameworks/*.xcframework'

end
