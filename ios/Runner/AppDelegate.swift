import Flutter
import UIKit
import Firebase
import FirebaseAuth

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    FirebaseApp.configure()
    
    // Setting Firebase Auth for iOS
    if #available(iOS 10.0, *) {
      Auth.auth().tenantID = nil
    }
    
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
  
  // Handle URL schemes - Important for Firebase Phone Auth
  override func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
    // Pass URL to Flutter for handling
    let handled = super.application(app, open: url, options: options)
    return handled
  }
  
  // Handle universal links
  override func application(_ application: UIApplication,
                            continue userActivity: NSUserActivity,
                            restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
    // Get URL components from the incoming user activity
    guard userActivity.activityType == NSUserActivityTypeBrowsingWeb,
          let incomingURL = userActivity.webpageURL else {
      return false
    }
    
    // Pass the URL to Flutter for handling
    return super.application(application, continue: userActivity, restorationHandler: restorationHandler)
  }
}
