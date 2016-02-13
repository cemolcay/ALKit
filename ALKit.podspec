#
#  Be sure to run `pod spec lint ALKit.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  s.name         = "ALKit"
  s.version      = "0.4"
  s.summary      = "Easy to use AutoLayout wrapper around `NSLayoutConstraints`."

  # This description is used to generate tags and improve search results.
  #   * Think: What does it do? Why did you write it? What is the focus?
  #   * Try to keep it short, snappy and to the point.
  #   * Write the description between the DESC delimiters below.
  #   * Finally, don't worry about the indent, CocoaPods strips it!
  s.description  = <<-DESC
ALKit
===

Easy to use AutoLayout wrapper around `NSLayoutConstraints`.

Install
----

#### Cocoapods

``` ruby
!use_frameworks
pod 'ALKit'
```

### Manual

Copy the `ALKit` folder into your project

Documentation
----

### Init

Initialzes autolayout ready views.


``` swift
convenience init (withAutolayout: Bool) {
self.init(frame: CGRect.zero)
translatesAutoresizingMaskIntoConstraints = false
}
```

``` swift
class func AutoLayout() -> UIView {
let view = UIView(frame: CGRect.zero)
view.translatesAutoresizingMaskIntoConstraints = false
return view
}
```

### Wraper

The main function of all kit.
Wraps `addConstraint:` method of autolayout.

``` swift
public func pin(
edge: NSLayoutAttribute,
toEdge: NSLayoutAttribute,
ofView: UIView?,
withInset: CGFloat = 0) {
guard let view = superview else {
return assertionFailure("view must be added as subview in view hierarchy")
}
view.addConstraint(NSLayoutConstraint(
item: self,
attribute: edge,
relatedBy: .Equal,
toItem: ofView,
attribute: toEdge,
multiplier: 1,
constant: withInset))
}
```

```

override func viewDidLoad() {
super.viewDidLoad()

// setup views

let box = UIView.AutoLayout()
box.backgroundColor = UIColor.greenColor()
view.addSubview(box)

let blue = UIView.AutoLayout()
blue.backgroundColor = UIColor.blueColor()
box.addSubview(blue)

let red = UIView.AutoLayout()
red.backgroundColor = UIColor.redColor()
box.addSubview(red)

let yellow = UIView.AutoLayout()
yellow.backgroundColor = UIColor.yellowColor()
box.addSubview(yellow)

// setup constraints

box.fill(toView: view)

blue.pinTop(toView: box, withInset: 10)
blue.fillHorizontal(toView: box, withInset: 10)
blue.pinHeight(90)

red.pinBottom(toView: box, withInset: 10)
red.fillHorizontal(toView: box, withInset: 10)
red.pinHeight(90)

yellow.pinToTop(ofView: red, withOffset: 10)
yellow.pinCenterX(toView: red)
yellow.pinSize(width: 50, height: 50)
}

```
DESC

  s.homepage     = "https://github.com/cemolcay/ALKit"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"


  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Licensing your code is important. See http://choosealicense.com for more info.
  #  CocoaPods will detect a license file if there is a named LICENSE*
  #  Popular ones are 'MIT', 'BSD' and 'Apache License, Version 2.0'.
  #

  #s.license      = "MIT"
  s.license      = { :type => "MIT", :file => "ALKit/LICENSE" }


  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the authors of the library, with email addresses. Email addresses
  #  of the authors are extracted from the SCM log. E.g. $ git log. CocoaPods also
  #  accepts just a name if you'd rather not provide an email address.
  #
  #  Specify a social_media_url where others can refer to, for example a twitter
  #  profile URL.
  #

  s.author             = { "cemolcay" => "ccemolcay@gmail.com" }
  # Or just: s.author    = "cemolcay"
  # s.authors            = { "cemolcay" => "ccemolcay@gmail.com" }
  # s.social_media_url   = "http://twitter.com/cemolcay"

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If this Pod runs only on iOS or OS X, then specify the platform and
  #  the deployment target. You can optionally include the target after the platform.
  #

  #  When using multiple platforms
  s.ios.deployment_target = "8.0"
  # s.osx.deployment_target = "10.7"
  # s.watchos.deployment_target = "2.0"
  s.tvos.deployment_target = "9.0"


  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the location from where the source should be retrieved.
  #  Supports git, hg, bzr, svn and HTTP.
  #

  s.source       = { :git => "https://github.com/cemolcay/ALKit.git", :tag => "v0.4" }


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  CocoaPods is smart about how it includes source code. For source files
  #  giving a folder will include any swift, h, m, mm, c & cpp files.
  #  For header files it will include any header in the folder.
  #  Not including the public_header_files will make all headers public.
  #

  s.source_files  = "ALKit/ALKit/*.swift"
  # s.public_header_files = "Classes/**/*.h"


  # ――― Resources ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  A list of resources included with the Pod. These are copied into the
  #  target bundle with a build phase script. Anything else will be cleaned.
  #  You can preserve files from being cleaned, please don't preserve
  #  non-essential files like tests, examples and documentation.
  #

  # s.resource  = "icon.png"
  # s.resources = "Resources/*.png"

  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"


  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Link your library with frameworks, or libraries. Libraries do not include
  #  the lib prefix of their name.
  #

  # s.framework  = "SomeFramework"
  # s.frameworks = "SomeFramework", "AnotherFramework"

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"


  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If your library depends on compiler flags you can set them in the xcconfig hash
  #  where they will only apply to your library. If you depend on other Podspecs
  #  you can include multiple dependencies to ensure it works.

  s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"

end
