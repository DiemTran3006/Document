//
//  RegisterViewController.swift
//  Document
//
//  Created by Diem Tran on 26/10/2023.
//

import UIKit

class RegisterViewController: UIViewController {
    
   
    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var errorName: UIView!
    @IBOutlet weak var ViewNameTextfield: UIView!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var errorEmail: UIView!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var viewEmailTextfield: UIView!
    @IBOutlet weak var errorPassword: UIView!
    @IBOutlet weak var starButton: UIButton!
    @IBOutlet weak var viewPasswordTextfield: UIView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var cameraImage: UIImageView!
    @IBOutlet weak var serviceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        passwordTextfield.enablePasswordToggle()
        settingAttrLabel()
        addPadding()
        viewCheckFormat()
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
    
  
    func checkvalidate() {
        let name = nameTextfield.text.asStringOrEmpty()
        let email = emailTextfield.text.asStringOrEmpty()
        let password = passwordTextfield.text.asStringOrEmpty()
        
        let border = UIColor(hexString: "#8E7F7F").cgColor
        let borderError = UIColor(hexString: "#DA1414").cgColor

        errorName.isHidden = name.isUserName || name.isEmpty
        ViewNameTextfield.layer.borderColor = name.isUserName || name.isEmpty ? border : borderError
        
        errorEmail.isHidden = email.isValidEmail || email.isEmpty
        viewEmailTextfield.layer.borderColor = email.isValidEmail || email.isEmpty ? border : borderError
        
        errorPassword.isHidden = password.isValidPassword || password.isEmpty
        viewPasswordTextfield.layer.borderColor = password.isValidPassword || password.isEmpty ? border : borderError
        if name.isUserName && email.isValidEmail && password.isValidPassword {
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
    }
    func addPadding() {
        nameTextfield.addPadding(.left(15))
        emailTextfield.addPadding(.left(15))
        passwordTextfield.addPadding(.left(15))
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
    
    @IBAction func actionStartLogin(_ sender: Any) {
        let VC = LoginViewController(nibName: "LoginViewController", bundle: nil)
        VC.email = emailTextfield.text ?? ""
        VC.password = passwordTextfield.text ?? ""
        self.navigationController?.pushViewController( VC, animated: true)
    }
    @IBAction func actionPopLoginButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
