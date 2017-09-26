import Foundation
import SwiftMessages

public protocol InternetStatusIndicable : class {
    var internetConnectionIndicator:InternetViewIndicator? { get set }
    func startMonitoringInternet(backgroundColor:UIColor, style: MessageView.Layout, textColor:UIColor, message:String, remoteHostName: String)
}

extension InternetStatusIndicable where Self: UIViewController {
    
    public func startMonitoringInternet(backgroundColor: UIColor = UIColor.red, style: MessageView.Layout = .statusLine, textColor: UIColor = UIColor.white, message: String = "Please, check your internet connection", remoteHostName: String = "apple.com") {
        
        internetConnectionIndicator = InternetViewIndicator(backgroundColor: backgroundColor, style: style, textColor: textColor, message: message, remoteHostName: remoteHostName)
    
    }
}
