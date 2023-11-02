//
//  RegisterViewController+Validate.swift
//  Document
//
//  Created by Diem Tran on 31/10/2023.
//

import Foundation

extension RegisterViewController {
    
    func checkvalidate() {
        let name = nameTextfield.text.asStringOrEmpty()
        let email = emailTextfield.text.asStringOrEmpty()
        let password = passwordTextfield.text.asStringOrEmpty()
        let confirmPassword = confirmPasswordTextField.text.asStringOrEmpty()
        
        if  name.isUserName || name.isEmpty {
            nameTextfield.setOutlineColor(.init(hexString: "8E7F7F"), for: .normal)
            nameTextfield.setOutlineColor(.init(hexString: "8E7F7F"), for: .editing)
            errorName.isHidden = true
        } else {
            nameTextfield.setOutlineColor(.init(hexString: "DA1414"), for: .normal)
            nameTextfield.setOutlineColor(.init(hexString: "DA1414"), for: .editing)
            errorName.isHidden = false
        }
        if  email.isValidEmail || email.isEmpty {
            emailTextfield.setOutlineColor(.init(hexString: "8E7F7F"), for: .normal)
            emailTextfield.setOutlineColor(.init(hexString: "8E7F7F"), for: .editing)
            errorEmail.isHidden = true
        } else {
            emailTextfield.setOutlineColor(.init(hexString: "DA1414"), for: .normal)
            emailTextfield.setOutlineColor(.init(hexString: "DA1414"), for: .editing)
            errorEmail.isHidden = false
        }
        if  password.isValidPassword || password.isEmpty {
            passwordTextfield.setOutlineColor(.init(hexString: "8E7F7F"), for: .normal)
            passwordTextfield.setOutlineColor(.init(hexString: "8E7F7F"), for: .editing)
            errorPassword.isHidden = true
        } else {
            passwordTextfield.setOutlineColor(.init(hexString: "DA1414"), for: .normal)
            passwordTextfield.setOutlineColor(.init(hexString: "DA1414"), for: .editing)
            errorPassword.isHidden = false
        }
        if confirmPassword == password || confirmPassword.isEmpty {
            confirmPasswordTextField.setOutlineColor(.init(hexString: "8E7F7F"), for: .normal)
            confirmPasswordTextField.setOutlineColor(.init(hexString: "8E7F7F"), for: .editing)
            errorConfirmPassword.isHidden = true
        } else {
            confirmPasswordTextField.setOutlineColor(.init(hexString: "DA1414"), for: .normal)
            confirmPasswordTextField.setOutlineColor(.init(hexString: "DA1414"), for: .editing)
            errorConfirmPassword.isHidden = false
        }
        if name.isUserName && email.isValidEmail && password.isValidPassword && password == confirmPassword {
            starButton.isUserInteractionEnabled = true
            starButton.backgroundColor = .init(hexString: "294E68")
        } else {
            starButton.isUserInteractionEnabled = false
            starButton.backgroundColor = .init(hexString: "294E68").withAlphaComponent(0.5)
        }
    }
    
    func viewCheckFormat() {
        errorName.isHidden = true
        errorEmail.isHidden = true
        errorPassword.isHidden = true
        errorConfirmPassword.isHidden = true
    }
    
    func customTextField() {
        nameTextfield.label.text = "Name"
        nameTextfield.containerRadius = 10
        nameTextfield.setOutlineColor(.init(hexString: "8E7F7F"), for: .normal)
        nameTextfield.setOutlineColor(.init(hexString: "8E7F7F"), for: .editing)
        nameTextfield.sizeToFit()
        
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
        
        confirmPasswordTextField.label.text = "Confirm Password"
        confirmPasswordTextField.containerRadius = 10
        confirmPasswordTextField.setOutlineColor(.init(hexString: "8E7F7F"), for: .normal)
        confirmPasswordTextField.setOutlineColor(.init(hexString: "8E7F7F"), for: .editing)
        confirmPasswordTextField.sizeToFit()
    }
}
