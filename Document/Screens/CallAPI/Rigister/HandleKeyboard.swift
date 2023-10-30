//
//  HandleKeyboard.swift
//  Document
//
//  Created by Diem Tran on 28/10/2023.
//

import Foundation
import UIKit
import MaterialComponents

extension RegisterViewController {
    
    func handleKeyboard() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
   func textFieldDidEndEditing(_ textField: UITextField) {
        self.passwordTextfield = nil
    }
    
   func textFieldDidBeginEditing(_ textField: UITextField) {
       self.passwordTextfield = textField as? MDCOutlinedTextField
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        
        if let activeField = passwordTextfield,
            let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            let contenInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize.height, right: 0.0)
            self.scrollView.contentInset = contenInsets
            self.scrollView.scrollIndicatorInsets = contenInsets
            var aRect = self.view.frame
            aRect.size.height -= keyboardSize.size.height
            if (!CGRectContainsPoint(aRect, activeField.frame.origin)) {
                self.scrollView.scrollRectToVisible(activeField.frame, animated: true)
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        let contenInsets = UIEdgeInsets()
        self.scrollView.contentInset = contenInsets
        self.scrollView.scrollIndicatorInsets = contenInsets
    }
    
}
extension RegisterViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        activeField = textField
        lastOffset = self.scrollView.contentOffset
        return true
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        activeField?.resignFirstResponder()
        activeField = nil
        return true
    }
}
