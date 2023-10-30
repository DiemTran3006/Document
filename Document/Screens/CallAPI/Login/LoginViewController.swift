//
//  LoginViewController.swift
//  Document
//
//  Created by Diem Tran on 26/10/2023.
//

import UIKit
import Toast_Swift
import MaterialComponents

class LoginViewController: UIViewController {
    
    var email = ""
    var password = ""
    
    @IBOutlet weak var emailTextfield: MDCOutlinedTextField!
    @IBOutlet weak var passwordTextfield: MDCOutlinedTextField!
    
    
    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        passwordTextfield.enablePasswordToggle()
        title = Menu.callAPI.title
        emailTextfield.text = email
        passwordTextfield.text = password
        checkValidate()
        propertiesTextfiled()
        hideKeyboardWhenTappedAround()
        customTextField()
    }
    
    private func customTextField() {
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
    
    @IBAction func changeEmaialTextfield(_ sender: Any) {
        checkValidate()
    }
    
    @IBAction func changePasswordTextfield(_ sender: Any) {
        checkValidate()
    }
    
    @IBAction func actionLogin(_ sender: Any) {
        let param: LoginRequest = LoginRequest(email: emailTextfield.text!,
                                               password: passwordTextfield.text!)
        APIFetchManager.shared.login(param: param) { [weak self] apiData in
            guard let self = self else { return }
            AppConstant.saveUser(model: apiData)
            self.view.makeToast("Login Succsess" , position: .bottom)
            self.navigationController?.setRootViewController(viewController: ProfileViewController() ,
                                                             controllerType: ProfileViewController.self)
        } handlerError: { error in
            self.view.makeToast(error , position: .bottom)
        }
        
    }
    private func checkValidate() {
        
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
    private func propertiesTextfiled() {
        passwordTextfield.enablePasswordToggle()
    }
    
    @IBAction func actionPop(_ sender: Any) {
            self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func pushFogotPassword(_ sender: Any) {
        let VC = ForgotPasswordViewController(nibName: "ForgotPasswordViewController", bundle: nil)
        self.navigationController?.pushViewController( VC, animated: true)
    }
    
    @IBAction func actionPushSignUpButton(_ sender: Any) {
        let VC = RegisterViewController(nibName: "RegisterViewController", bundle: nil)
        self.navigationController?.pushViewController( VC, animated: true)
    }
}

