import Foundation
import ReachabilitySwift
import SwiftMessages

extension String {
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
}

public class InternetViewIndicator {
    
    private var reachability: Reachability?
    public var indicatorBackgroundColor: UIColor
    public var message: String
    
    init(backgroundColor:UIColor = UIColor.red, message:String = "Please, check your internet connection", remoteHostName: String = "apple.com") {
        
        self.indicatorBackgroundColor = backgroundColor
        self.message = message
        self.setupReachability(remoteHostName)
        self.startNotifier()
    
    }
    
    func setupReachability(_ hostName: String?) {
        
        let reachability = hostName == nil ? Reachability() : Reachability(hostname: hostName!)
        self.reachability = reachability
        NotificationCenter.default.addObserver(self, selector: #selector(InternetViewIndicator.reachabilityChanged(_:)), name: ReachabilityChangedNotification, object: reachability)
    
    }
    
    @objc func reachabilityChanged(_ note: Notification) {
        
        let reachability = note.object as! Reachability
        
        let status = MessageView.viewFromNib(layout: .StatusLine)
        status.backgroundView.backgroundColor = self.indicatorBackgroundColor
        status.bodyLabel?.textColor = UIColor.white
        status.configureContent(body: NSLocalizedString(self.message, comment: "internet failure"))
        
        var statusConfig = SwiftMessages.defaultConfig
        statusConfig.duration = .forever
        statusConfig.presentationContext = .window(windowLevel: UIWindowLevelStatusBar)
        
        if reachability.isReachable {
            SwiftMessages.hide()
        } else {
            SwiftMessages.show(config: statusConfig, view: status)
        
        }
    }
    
    func startNotifier() {
        do {
            try reachability?.startNotifier()
        } catch {
            return
        }
    }
    
}
