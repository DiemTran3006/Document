//
//  LoginViewController+Validate.swift
//  Document
//
//  Created by Diem Tran on 01/11/2023.
//

import Foundation

extension LoginViewController {
    
    func checkValidate() {
        
        let password = passwordTextfield.text.asStringOrEmpty()
        let email = emailTextfield.text.asStringOrEmpty()
        
        if  email.isValidEmail || email.isEmpty {
            emailTextfield.setOutlineColor(.init(hexString: "8E7F7F"), for: .normal)
            emailTextfield.setOutlineColor(.init(hexString: "8E7F7F"), for: .editing)
        } else {
            emailTextfield.setOutlineColor(.init(hexString: "DA1414"), for: .normal)
            emailTextfield.setOutlineColor(.init(hexString: "DA1414"), for: .editing)
        }
        if  password.isValidPassword || password.isEmpty {
            passwordTextfield.setOutlineColor(.init(hexString: "8E7F7F"), for: .normal)
            passwordTextfield.setOutlineColor(.init(hexString: "8E7F7F"), for: .editing)
        } else {
            passwordTextfield.setOutlineColor(.init(hexString: "DA1414"), for: .normal)
            passwordTextfield.setOutlineColor(.init(hexString: "DA1414"), for: .editing)
        }
        if email.isValidEmail && password.isValidPassword {
            loginButton.isUserInteractionEnabled = true
            loginButton.backgroundColor = .init(hexString: "294E68")
        } else {
            loginButton.isUserInteractionEnabled = false
            loginButton.backgroundColor = .init(hexString: "294E68").withAlphaComponent(0.5)
        }
    }
    
    func customTextField() {
        emailTextfield.label.text = "Email"
        emailTextfield.containerRadius = 10
        emailTextfield.setOutlineColor(.init(hexString: "8E7F7F"), for: .normal)
        emailTextfield.setOutlineColor(.init(hexString: "8E7F7F"), for: .editing)
        emailTextfield.sizeToFit()
        
        passwordTextfield.label.text = "Password"
        passwordTextfield.containerRadius = 10
        passwordTextfield.setOutlineColor(.init(hexString: "8E7F7F"), for: .normal)
        passwordTextfield.setOutlineColor(.init(hexString: "8E7F7F"), for: .editing)
        passwordTextfield.sizeToFit()
    }
    
    func propertiesTextfiled() {
        passwordTextfield.enablePasswordToggle()
    }
    
}
