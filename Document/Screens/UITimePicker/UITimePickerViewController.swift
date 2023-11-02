//
//  UITimePickerViewController.swift
//  Document
//
//  Created by Diem Tran on 18/10/2023.
//

import UIKit

class UITimePickerViewController: UIViewController {
    
    @IBOutlet weak var timepickerTextfield: UITextField!
    
    @IBAction func actionPopMenu(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        creaateTimePicker()
    }
    
    func creaateTimePicker() {
        let time = Date()
        let formatter = DateFormatter()
        formatter.locale = .current
        formatter.dateFormat = "HH:mm:ss"
        timepickerTextfield.text = formatter.string(from: time)
        
        let timePickker = UIDatePicker()
        timePickker.datePickerMode = .time
        timePickker.addTarget(self,
                              action: #selector(timePickerValueChange(sender:)),
                              for: UIControl.Event.valueChanged)
        timePickker.frame.size = CGSize(width: 0, height: 250)
        timepickerTextfield.inputView = timePickker
    }
    
    @objc func timePickerValueChange( sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.locale = .current
        formatter.dateFormat = "HH:mm:ss"
        timepickerTextfield.resignFirstResponder()
        timepickerTextfield.text = formatter.string(from: sender.date)
    }
}
