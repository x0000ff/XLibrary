Pod::Spec.new do |s|
  s.name         = "XLibrary"
  s.version      = "0.1"
  s.summary      = "Utilities by x0000ff"
  s.homepage     = "https://github.com/x0000ff/XLibrary"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "Konstantin Portnov" => "x0000ff@gmail.com" }
  s.source       = { :git => "https://github.com/x0000ff/XLibrary.git", :tag => "0.1" }
  s.platform     = :ios, '6.1'
  # s.source_files = 'XLibrary/**/*.{h,m}"
  s.source_files = "XLibrary/**/*.{h,m}"
  s.exclude_files = "XLibrary/Exclude"
  s.resource     = "Resources/*.png"
  s.requires_arc = true
  s.framework  = 'QuartzCore', 'CoreGraphics'
  s.dependency 'MBProgressHUD',	'~> 0.8'
#  s.dependency 'FontAwesomeTools', '~> 1.1'
end
