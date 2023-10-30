//
//  RegisterViewController.swift
//  Document
//
//  Created by Diem Tran on 26/10/2023.
//

import UIKit
import Toast_Swift
import MaterialComponents

class RegisterViewController: UIViewController {
    var linkImage: String = ""
    var activeField: UITextField?
    var lastOffset: CGPoint?
    
    @IBOutlet weak var nameTextfield: MDCOutlinedTextField!
    @IBOutlet weak var errorName: UIView!
    @IBOutlet weak var emailTextfield: MDCOutlinedTextField!
    @IBOutlet weak var errorEmail: UIView!
    @IBOutlet weak var passwordTextfield: MDCOutlinedTextField!
    @IBOutlet weak var errorPassword: UIView!
    @IBOutlet weak var confirmPasswordTextField: MDCOutlinedTextField!
    @IBOutlet weak var errorConfirmPassword: UIView!
    @IBOutlet weak var starButton: UIButton!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var cameraImage: UIImageView!
    @IBOutlet weak var serviceLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideKeyboardWhenTappedAround()
        passwordTextfield.enablePasswordToggle()
        confirmPasswordTextField.enablePasswordToggle()
        settingAttrLabel()
        checkvalidate()
        viewCheckFormat()
        handleKeyboard()
        customTextField()
    }
    
    @IBAction func changedNameTextfiled(_ sender: Any) {
        checkvalidate()
    }
    
    @IBAction func changedEmailTextfiled(_ sender: Any) {
        checkvalidate()
    }
    
    @IBAction func changedPasswordTextfiled(_ sender: Any) {
        checkvalidate()
    }
    
    @IBAction func changedConfirmPasswordTextfiled(_ sender: Any) {
        checkvalidate()
    }
    
    private func checkvalidate() {
        
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
    
    private func customTextField() {
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
    
    private func viewCheckFormat() {
        errorName.isHidden = true
        errorEmail.isHidden = true
        errorPassword.isHidden = true
        errorConfirmPassword.isHidden = true
    }
    
    private func settingAttrLabel() {
        let attrText = NSMutableAttributedString.getAttributedString(fromString: "By registering, you agree to our Terms of Service")
        attrText.apply(color: UIColor(hexString: "#294E68"), subString: "Terms of Service")
        serviceLabel.attributedText = attrText
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapLabelProvision(tap:)))
        serviceLabel.addGestureRecognizer(tap)
        serviceLabel.isUserInteractionEnabled = true
    }
    
    @objc func tapLabelProvision(tap: UITapGestureRecognizer) {
    }
    
    @IBAction func starButton(_ sender: Any) {
        
        let param: RegisterRequest = RegisterRequest(email: emailTextfield.text!,
                                                     password: passwordTextfield.text!,
                                                     user_name: nameTextfield.text!,
                                                     ip_register: linkImage,
                                                     device_register: AppConstant.IPAddress.asStringOrEmpty(),
                                                     link_avatar: AppConstant.modelName.asStringOrEmpty()
        )
        APIFetchManager.shared.register(param: param) { [weak self] apiData in
            self?.view.makeToast(apiData.message , position: .bottom)
            print(apiData)
        } handlerError: { error in
            self.view.makeToast(error , position: .bottom)
        }
        
        let alert = UIAlertController(title: "Register", message: "Do you want to continue registering?", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Continue", style: UIAlertAction.Style.default, handler: {_ in self.login()}))
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    private func login() {
        let VC = LoginViewController(nibName: "LoginViewController", bundle: nil)
        VC.email = emailTextfield.text ?? ""
        VC.password = passwordTextfield.text ?? ""
        self.navigationController?.pushViewController( VC, animated: true)
    }
    
    @IBAction func actionPushLoginButton(_ sender: Any) {
        let VC = LoginViewController(nibName: "LoginViewController", bundle: nil)
        VC.email = emailTextfield.text ?? ""
        VC.password = passwordTextfield.text ?? ""
        self.navigationController?.pushViewController( VC, animated: true)
    }
    
    @IBAction func actionPopLoginButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

