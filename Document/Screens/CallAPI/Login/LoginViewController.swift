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
        emailTextfield.text = email
        passwordTextfield.text = password
        checkValidate()
        propertiesTextfiled()
        hideKeyboardWhenTappedAround()
        customTextField()
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
        } handlerError: { error in
            self.view.makeToast(error , position: .bottom)
        }
        self.presentConfirmationAlert(title: "Login",
                                      message: "would you like to Login?",
                                      okOption: "Continue",
                                      cancelOption: "Cancel") {
                    } cancelCallback: {}
    }
   
    @IBAction func pushFogotPassword(_ sender: Any) {
        let VC = ForgotPasswordViewController(nibName: "ForgotPasswordViewController", bundle: nil)
        self.navigationController?.pushViewController( VC, animated: true)
    }
    
    @IBAction func actionPushSignUpButton(_ sender: Any) {
        let VC = RegisterViewController(nibName: "RegisterViewController", bundle: nil)
        self.navigationController?.pushViewController( VC, animated: true)
    }
    
    @IBAction func actionPop(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

