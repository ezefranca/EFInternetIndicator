import Foundation

public protocol InternetStatusIndicable : class {
    var internetConnectionIndicator:InternetViewIndicator? { get set }
    func startMonitoringInternet(backgroundColor: UIColor , message: String, remoteHostName: String)
}

extension InternetStatusIndicable where Self: UIViewController {
    
    public func startMonitoringInternet(backgroundColor:UIColor = UIColor.red, message:String = "Please, check your internet connection", remoteHostName: String = "apple.com") {
        
        internetConnectionIndicator = InternetViewIndicator(backgroundColor: backgroundColor, message: message, remoteHostName: remoteHostName)
    
    }
}
