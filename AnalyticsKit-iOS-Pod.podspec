Pod::Spec.new do |s|
s.name             = 'AnalyticsKit-iOS-Pod'
s.version='2.0.1'
s.summary          = 'The AnalyticsKit-iOS-Pod for the Jibestream iOS SDK.'

s.description      = 'This CocoaPod provides the release version of the AnalyticsKit for the Jibestream iOS SDK.'

s.homepage         = 'http://www.jibestream.com/'
s.author           = { 'louieyune' => 'lyuen@jibestream.com' }
s.source           = { :git => 'https://github.com/Jibestream/AnalyticsKit-iOS-Pod', :tag => "#{s.version}" }

s.ios.deployment_target = '10.0'
s.platform = :ios, '10.0'
s.vendored_frameworks = 'AnalyticsKit-iOS-Pod/Frameworks/*.xcframework'

end
