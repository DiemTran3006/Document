//
//  AppDelegate.swift
//  Document
//
//  Created by Diem Tran on 18/10/2023.
//
import UIKit
import FirebaseAuth
import FirebaseCore
import GoogleSignIn
import FBSDKCoreKit
import Firebase
import FirebaseMessaging
import UserNotifications

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        
        // Config google
        let clientID = FirebaseApp.app()?.options.clientID
        let config = GIDConfiguration(clientID: clientID ?? "")
        GIDSignIn.sharedInstance.configuration = config
        // Config facebook
        ApplicationDelegate.shared.application(
            application,
            didFinishLaunchingWithOptions: launchOptions )
        
        registerForPushNotifications()

    
        return true
    }
    
    private func registerForPushNotifications() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { (permissionGranted, error) in
            DispatchQueue.main.async {
                print("registerForPushNotifications permissionGranted? \(permissionGranted)")
                guard permissionGranted else { return }
                self.getNotificationSettings()
            }
        }
    }
    
    private func getNotificationSettings() {
        UNUserNotificationCenter.current().delegate = self
        UIApplication.shared.delegate = self
        Messaging.messaging().delegate = self
        let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
        UNUserNotificationCenter.current().requestAuthorization(options: authOptions,
                                                                completionHandler: {_, _ in })
        UIApplication.shared.registerForRemoteNotifications()
    }
    
    func application(_ application: UIApplication,
                     configurationForConnecting connectingSceneSession: UISceneSession,
                     options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication,
                     didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    func application(_ app: UIApplication,
                     open url: URL,
                     options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        ApplicationDelegate.shared.application(
            app,
            open: url,
            sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String,
            annotation: options[UIApplication.OpenURLOptionsKey.annotation]
        )
    }
}


extension AppDelegate: UNUserNotificationCenterDelegate {
    public func application(_ application: UIApplication,
                            didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("register notification fail: \(error)")
    }
    
    public func application(_ application: UIApplication,
                           didReceiveRemoteNotification userInfo: [AnyHashable: Any]) {
        print(userInfo)
    }
    
    public func application(_ application: UIApplication,
                            didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        print("deviceToken: \(deviceToken)")
    }
    
    public func application(_ application: UIApplication,
                            didReceiveRemoteNotification userInfo: [AnyHashable: Any],
                            fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        completionHandler(UIBackgroundFetchResult.newData)
    }
    
    public func userNotificationCenter(_ center: UNUserNotificationCenter,
                                       didReceive response: UNNotificationResponse,
                                       withCompletionHandler completionHandler: @escaping () -> Void) {
        let userInfo = response.notification.request.content.userInfo
        print(userInfo)
        completionHandler()
    }
    
    public func userNotificationCenter(_ center: UNUserNotificationCenter,
                                       willPresent notification: UNNotification,
                                       withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner, .badge, .sound])
    }
}

extension AppDelegate: MessagingDelegate {
    public func messaging(_ messaging: Messaging, didRefreshRegistrationToken fcmToken: String) {
        print("Firebase refresh registration token: \(fcmToken)")
        
    }
    
    public func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        print("Firebase received registration token: \(fcmToken ?? "")")
    }
}
