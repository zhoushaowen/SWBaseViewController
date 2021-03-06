Pod::Spec.new do |s|

  s.name         = "SWBaseViewController"

  s.version      = "1.1.5"

  s.homepage      = 'https://github.com/zhoushaowen/SWBaseViewController'

  s.ios.deployment_target = '8.0'

  s.summary      = "自定义导航"

  s.license      = { :type => 'MIT', :file => 'LICENSE' }

  s.author       = { "Zhoushaowen" => "348345883@qq.com" }

  s.source       = { :git => "https://github.com/zhoushaowen/SWBaseViewController.git", :tag => s.version }
  
  s.source_files  = "SWBaseViewController/SWBaseViewController/*.{h,m}"
  
  s.requires_arc = true

  s.deprecated   = true


end