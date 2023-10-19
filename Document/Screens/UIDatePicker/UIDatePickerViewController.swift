//
//  UIDatePickerViewController.swift
//  Document
//
//  Created by Diem Tran on 18/10/2023.
//

import UIKit

class UIDatePickerViewController: UIViewController {

    @IBOutlet weak var birthdayTextfield: UITextField!
     
    let dataPicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        creaateDatapicker()
        title = Menu.UIDatePicker.title
    }


    func createToolbar() -> UIToolbar {
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePresend))
        toolbar.setItems([doneBtn], animated: true)
        return toolbar
    }
    func creaateDatapicker() {
        dataPicker.preferredDatePickerStyle = .wheels
        dataPicker.datePickerMode = .date
        birthdayTextfield.textAlignment = .center
        birthdayTextfield.inputView = dataPicker
        birthdayTextfield.inputAccessoryView = createToolbar()
    }
    @objc func donePresend() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        self.birthdayTextfield.text = dateFormatter.string(from: dataPicker.date)
        self.view.endEditing(true)
    }
}
