//
//  LoginViewController.swift
//  Document
//
//  Created by Diem Tran on 26/10/2023.
//

import UIKit

class LoginViewController: UIViewController {
    
    var email = ""
    var password = ""
    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var viewEmailTextfield: UIView!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var viewPasswordTextfield: UIView!
    
    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextfield.text = email
        passwordTextfield.text = password
        checkValidate()
        propertiesTextfiled()
        hideKeyboardWhenTappedAround()
        self.navigationController?.isNavigationBarHidden = true
    }

    @IBAction func changeEmailTextfield(_ sender: Any) {
        checkValidate()
    }
    
    @IBAction func changePasswordTextfield(_ sender: Any) {
        checkValidate()
    }
    
    @IBAction func actionSignIn(_ sender: Any) {
    }
   private func checkValidate() {
       
        let password = passwordTextfield.text.asStringOrEmpty()
        let email = emailTextfield.text.asStringOrEmpty()
        
        if  email.isValidEmail || email.isEmpty {
            viewEmailTextfield.layer.borderColor = UIColor(hexString: "#8E7F7F").cgColor
        } else {
            viewEmailTextfield.layer.borderColor = UIColor(hexString: "#DA1414").cgColor
        }
        
       if  password.isValidPassword || password.isEmpty {
           viewPasswordTextfield.layer.borderColor = UIColor(hexString: "#8E7F7F").cgColor
       } else {
           viewPasswordTextfield.layer.borderColor = UIColor(hexString: "#DA1414").cgColor
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
        emailTextfield.addPadding(.left(15))
        passwordTextfield.addPadding(.left(15))
        passwordTextfield.enablePasswordToggle()
    }
    
    @IBAction func actionPop(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func pushFogotPassword(_ sender: Any) {
    }
    
    @IBAction func actionPushSignUpButton(_ sender: Any) {
        let VC = RegisterViewController(nibName: "RegisterViewController", bundle: nil)
        self.navigationController?.pushViewController( VC, animated: true)
    }
}
