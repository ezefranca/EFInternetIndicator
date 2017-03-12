# EFInternetIndicator

[![CI Status](http://img.shields.io/travis/ezefranca/EFInternetIndicator.svg?style=flat)](https://travis-ci.org/ezefranca/EFInternetIndicator)
[![Version](https://img.shields.io/cocoapods/v/EFInternetIndicator.svg?style=flat)](http://cocoapods.org/pods/EFInternetIndicator)
[![License](https://img.shields.io/cocoapods/l/EFInternetIndicator.svg?style=flat)](http://cocoapods.org/pods/EFInternetIndicator)
[![Platform](https://img.shields.io/cocoapods/p/EFInternetIndicator.svg?style=flat)](http://cocoapods.org/pods/EFInternetIndicator)

![](https://media.giphy.com/media/3Pumvj8kXlsze/giphy.gif)![](https://media.giphy.com/media/hbZFtkGO3oXTi/giphy.gif)![](https://media.giphy.com/media/bqSwgtKgJD1uw/giphy.gif)

## Requirements

- Xcode 8.0+
- iOS 8.3+

**WARNING** : It's not work on simulator. [#1](https://github.com/ezefranca/EFInternetIndicator/issues/1)

## Installation

#### CocoaPods
You can use [CocoaPods](http://cocoapods.org/) to install `EFInternetIndicator` by adding it to your `Podfile`:

```ruby
use_frameworks!
pod 'EFInternetIndicator'
```

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Usage example

To start monitoring internet status in a single UIViewController you just need add the ```InternetStatusIndicable``` protocol and start monitoring with ```startMonitoringInternet()``` 

```swift

import UIKit
import EFInternetIndicator

class ViewController: UIViewController, InternetStatusIndicable {
    
    var internetConnectionIndicator:InternetViewIndicator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.startMonitoringInternet()
    }
}

```

Also, you can customize indicator using custom parameters: 

```swift
func startMonitoringInternet(backgroundColor:UIColor, style: MessageView.Layout, textColor:UIColor, message:String, remoteHostName: String)
```

If you want all yours UIViewControllers monitoring internet you can create a abstract class like:

```swift

import UIKit
import EFInternetIndicator

class EFViewController: UIViewController, InternetStatusIndicable {
    
    var internetConnectionIndicator:InternetViewIndicator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.startMonitoringInternet()
    }
}

class SecondViewController: EFViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }   
}

// Override properties when you want 
class MagicViewController: EFViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.startMonitoringInternet(backgroundColor:UIColor.blue, style: .StatusLine, textColor:UIColor.white, message:"No magic on internet here :(", remoteHostName: "magic.com")
    }   
}


```

## Author

ezefranca, ezequiel.ifsp@gmail.com

## Acknowledgments

- [@SwiftKickMobile](https://github.com/SwiftKickMobile) for SwiftMessages;
- [@ashleymills](https://github.com/ashleymills) for Reachability.swift;


## License

EFInternetIndicator is available under the MIT license. See the LICENSE file for more info.
