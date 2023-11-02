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
    }
    
//    PushNotication bằnh Local
    @IBAction func pushNotificationLocal(_ sender: Any) {
//  tạo nội dung thông báo
        let content = UNMutableNotificationContent()
//  thêm tiêu đề, phụ đề, nội dung và huy hiệu
        content.title = "Project Document"
        content.subtitle = "Thông báo"
        content.body = "Xin Chào"
//   nhận được trình kích hoạt thông báo
//   nó sẽ được gọi sau 5 giây
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
//   nhận được yêu cầu thông báo
        let request = UNNotificationRequest(identifier: UUID().uuidString,  content: content, trigger: trigger)
//   thêm thông báo vào trung tâm thông báo
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
    @IBAction func actionPopMenu(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
