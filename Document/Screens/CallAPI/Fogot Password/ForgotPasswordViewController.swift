//
//  ForgotPasswordViewController.swift
//  Document
//
//  Created by Diem Tran on 30/10/2023.
//

import UIKit
import Toast_Swift
import MaterialComponents

class ForgotPasswordViewController: UIViewController {
    
    @IBOutlet weak var resetPasswordTextfiled: MDCOutlinedTextField!
    @IBOutlet weak var errorEmail: UIView!
    @IBOutlet weak var resetPasswordButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customTextField()
        checkValidate()
        hideKeyboardWhenTappedAround()
    }
    
    func customTextField() {
        resetPasswordTextfiled.label.text = "Reset Password"
        resetPasswordTextfiled.containerRadius = 10
        resetPasswordTextfiled.setOutlineColor(.init(hexString: "8E7F7F"), for: .normal)
        resetPasswordTextfiled.setOutlineColor(.init(hexString: "8E7F7F"), for: .editing)
        resetPasswordTextfiled.sizeToFit()
    }
    func checkValidate() {
        let email = resetPasswordTextfiled.text.asStringOrEmpty()
        if  email.isValidEmail || email.isEmpty {
            resetPasswordTextfiled.setOutlineColor(.init(hexString: "8E7F7F"), for: .normal)
            resetPasswordTextfiled.setOutlineColor(.init(hexString: "8E7F7F"), for: .editing)
            errorEmail.isHidden = true
        } else {
            resetPasswordTextfiled.setOutlineColor(.init(hexString: "DA1414"), for: .normal)
            resetPasswordTextfiled.setOutlineColor(.init(hexString: "DA1414"), for: .editing)
            errorEmail.isHidden = false
        }
        if email.isValidEmail {
            resetPasswordButton.isUserInteractionEnabled = true
            resetPasswordButton.backgroundColor = .init(hexString: "294E68")
        } else {
            resetPasswordButton.isUserInteractionEnabled = false
            resetPasswordButton.backgroundColor = .init(hexString: "294E68").withAlphaComponent(0.5)
        }
    }
    
    @IBAction func changedResetPasswordTextfiled(_ sender: Any) {
        checkValidate()
    }
    
    @IBAction func actionResetPasswordButton(_ sender: Any) {
        let pram: ResetPassworResquest = ResetPassworResquest(email: resetPasswordTextfiled.text!)
        APIFetchManager.shared.resetPassword(param: pram) { apiData in
            self.view.makeToast(apiData.message , position: .bottom)
        } handlerError: { error in
            self.view.makeToast(error , position: .bottom)
        }
        let alert = UIAlertController(title: "UIAlertController", message: "Would you like to continue learning how to use iOS alerts?", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Continue", style: UIAlertAction.Style.default, handler: {_ in self.PopLogin()}))
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    func PopLogin() {
        let VC = LoginViewController(nibName: "LoginViewController", bundle: nil)
        self.navigationController?.pushViewController( VC, animated: true)
    }
    
    @IBAction func actionPopLogin(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
