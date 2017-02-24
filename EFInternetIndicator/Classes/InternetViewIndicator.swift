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
    private var status:MessageView
    
    init(backgroundColor:UIColor = UIColor.red, style: MessageView.Layout = .StatusLine, textColor:UIColor = UIColor.white, message:String = "Please, check your internet connection", remoteHostName: String = "apple.com") {
        
        status = MessageView.viewFromNib(layout: style)
        self.initializer(backgroundColor: backgroundColor, style: style, textColor: textColor, message: message, remoteHostName: remoteHostName, hideButton: true)
    }
    
    
    private func initializer(backgroundColor:UIColor = UIColor.red, style: MessageView.Layout = .StatusLine, textColor:UIColor = UIColor.white, message:String = "Please, check your internet connection", remoteHostName: String = "apple.com", hideButton:Bool = true) {
        
        status.button?.isHidden = hideButton
        status.iconLabel?.text = "❌"
        //TO DO: Refactor and make this parameters
        status.iconImageView?.isHidden = true
        status.titleLabel?.isHidden = true
        status.backgroundView.backgroundColor = backgroundColor
        status.bodyLabel?.textColor = textColor
        status.configureContent(body: NSLocalizedString(message, comment: "internet failure"))
        
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
