//
//  UITimePickerViewController.swift
//  Document
//
//  Created by Diem Tran on 18/10/2023.
//

import UIKit

class UITimePickerViewController: UIViewController {

    @IBOutlet weak var timepickerTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = Menu.UITimePicker.title
        creaateTimePicker()
    }
func creaateTimePicker() {
    
    let time = Date()
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "en_gb")
    formatter.dateFormat = "HH:mm:ss"
    timepickerTextfield.text = formatter.string(from: time)
    
    let timePickker = UIDatePicker()
    timePickker.datePickerMode = .time
    timePickker.addTarget(self, action: #selector(timePickerValueChange(sender:)), for: UIControl.Event.valueChanged)
    timePickker.frame.size = CGSize(width: 0, height: 250)
    timepickerTextfield.inputView = timePickker
}
    @objc func timePickerValueChange( sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_gb")
        formatter.dateFormat = "HH:mm:ss"
        timepickerTextfield.text = formatter.string(from: sender.date)
   }
}
