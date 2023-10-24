//
//  PushNotificationViewController.swift
//  Document
//
//  Created by Diem Tran on 24/10/2023.
//

import UIKit

class PushNotificationViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Menu.pushNotification.title
    }
    
    
    @IBAction func pushNotificationLocal(_ sender: Any) {
        //creating the notification content
        let content = UNMutableNotificationContent()
        //adding title, subtitle, body and badge
        content.title = "Hey this is Simplified iOS"
        content.subtitle = "iOS Development is fun"
        content.body = "We are learning about iOS Local Notification"
        //getting the notification trigger
        //it will be called after 5 seconds
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        //getting the notification request
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        //adding the notification to notification center
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
}
