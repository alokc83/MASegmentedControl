

Pod::Spec.new do |spec|

  spec.name         = "MASegmentedControl"
  spec.version      = "0.0.2"
  spec.summary      = "Very customizable segmented control for iOS."

  spec.description  = "Segmented control that is very customizable and can take any shape and size."

  spec.homepage     = "https://github.com/alokc83/MASegmentedControl"
  # spec.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"
  spec.license      = "MIT"

  spec.author             = { "Alok Choudhary" => "alok.c83@gmail.com" }
  spec.social_media_url   = "https://twitter.com/alokc83"

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If this Pod runs only on iOS or OS X, then specify the platform and
  #  the deployment target. You can optionally include the target after the platform.
  #
 
 spec.platform     = :ios, "11.0"

  #  When using multiple platforms
  # spec.ios.deployment_target = "5.0"
  # spec.osx.deployment_target = "10.7"
  # spec.watchos.deployment_target = "2.0"
  # spec.tvos.deployment_target = "9.0"

  spec.source       = { :git => "https://github.com/alokc83/MASegmentedControl.git", :tag => "#{spec.version}" }

  spec.framework = "UIKit"

  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  CocoaPods is smart about how it includes source code. For source files
  #  giving a folder will include any swift, h, m, mm, c & cpp files.
  #  For header files it will include any header in the folder.
  #  Not including the public_header_files will make all headers public.
  #

  spec.source_files  = "MASegmentedControl", "MASegmentedControl/**/*.{h,m,swift}"
  spec.exclude_files = "Classes/Exclude"

  spec.requires_arc = true
  spec.swift_version = "4.2"

end
