# FancyLoader

[![CI Status](https://img.shields.io/travis/sagaya/fancyloader.svg?style=flat)](https://travis-ci.org/sagaya/fancyloader)
[![Version](https://img.shields.io/cocoapods/v/fancyloader.svg?style=flat)](https://cocoapods.org/pods/fancyloader)
[![License](https://img.shields.io/cocoapods/l/fancyloader.svg?style=flat)](https://cocoapods.org/pods/fancyloader)
[![Platform](https://img.shields.io/cocoapods/p/fancyloader.svg?style=flat)](https://cocoapods.org/pods/fancyloader)

An easy way to handle full screen activity indicator.

![fancyloader](https://i.imgur.com/XuRlg94.gif)

Easy to use

### Get Started

```swift
// Show Loader
Loader.shared.show(image:String)

// Hide Loader
Loader.shared.hide()
```

### Controls

#### Custom Appearance

```swift
// You can modify the background color of the view by calling the initializer
Loader.shared.show(color:UIColor)

// To set the default image
//Call this in your AppDelegate file inside the didFinishLaunchingWithOptions function
Loader.shared.setImage(Image: "Ball")

// and the default background alpha is 0.7, you can of cos change this or set 1 so you can set custome color alpha
Loader.shared.show(backgroundAlpha:Double)

Loader.shared.showLoader(image:String?, color:UIColor?, backgroundAlpha:Double?)
```

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.



## Installation

fancyloader is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'fancyloader'
```

## Author

sagaya, shaggy.hafeez@gmail.com

## License

fancyloader is available under the MIT license. See the LICENSE file for more info.
