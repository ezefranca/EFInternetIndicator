#
# Be sure to run `pod lib lint EFInternetIndicator.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'EFInternetIndicator'
  s.version          = '0.1.0'
  s.summary          = 'A little Internet status indicator.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
A little swift Internet error status indicator using ReachabilitySwift.
                       DESC

  s.homepage         = 'https://github.com/ezefranca/EFInternetIndicator'
  s.screenshots      = 'https://media.giphy.com/media/3Pumvj8kXlsze/giphy.gif'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ezefranca' => 'ezequiel.ifsp@gmail.com' }
  s.source           = { :git => 'https://github.com/ezefranca/EFInternetIndicator.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/ezefranca'

  s.ios.deployment_target = '9.0'

  #s.source_files = 'EFInternetIndicator/Classes/**/*'
  
  #s.resource_bundles = {
  #   'EFInternetIndicator' => ['EFInternetIndicator/Assets/*.png']
  #}

  s.public_header_files = 'EFInternetIndicator/Classes/**/*.h'
  s.source_files = 'EFInternetIndicator/Classes/**/*.{c,h,hh,m,mm,swift}'
  s.subspec 'Network' do |network|
  	network.dependency 'ReachabilitySwift'
  end

  s.subspec 'Interface' do |interface|
  	interface.dependency 'SwiftMessages'
  end

end
