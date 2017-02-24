//
//  ViewController.swift
//  EFInternetIndicator
//
//  Created by ezefranca on 02/21/2017.
//  Copyright (c) 2017 ezefranca. All rights reserved.
//

import UIKit
import EFInternetIndicator

class ViewController: UIViewController, InternetStatusIndicable {
    
    var internetConnectionIndicator:InternetViewIndicator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.startMonitoringInternet()
        self.startMonitoringInternet(backgroundColor: UIColor.black, style: .MessageView, textColor: UIColor.white, message: "Please, check your internet connection", remoteHostName: "apple.com")
    }
}

