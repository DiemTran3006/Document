//
//  DataPassingViewController.swift
//  Document
//
//  Created by Diem Tran on 24/10/2023.
//

import UIKit

class DataPassingViewController: UIViewController {

    
    @IBOutlet weak var receiveDataTextfield: UITextField!
    @IBOutlet weak var errorEmailTextfield: UIView!
    
    @IBOutlet weak var errorPasswordTextfield: UIView!
    
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var emaiTextfield: UITextField!
    
    @IBOutlet weak var saveButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        receiveDataTextfield.addPadding(.left(15))
        passwordTextfield.addPadding(.left(15))
        emaiTextfield.addPadding(.left(15))
        passwordTextfield.enablePasswordToggle()
        hideKeyboardWhenTappedAround()
        checkValidate()
    }
    
    @IBAction func actionPopMenu(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func changedEmailTextfield(_ sender: Any) {
        checkValidate()
    }

    @IBAction func changedPasswordTextfield(_ sender: Any) {
        checkValidate()
    }
    private func checkValidate() {
        let email = emaiTextfield.text.asStringOrEmpty()
        let password = passwordTextfield.text.asStringOrEmpty()

        if email.isValidEmail || email.isEmpty
        {
            errorEmailTextfield.layer.borderColor = UIColor(hexString: "#D1D5DB").cgColor
        } else {
            errorEmailTextfield.layer.borderColor = UIColor(hexString: "#DA1414").cgColor
        }
        if password.isValidPassword || password.isEmpty
        {
            errorPasswordTextfield.layer.borderColor = UIColor(hexString: "#D1D5DB").cgColor
        } else {
            errorPasswordTextfield.layer.borderColor = UIColor(hexString: "#DA1414").cgColor
        }
        if email.isValidEmail && password.isValidPassword  {
            saveButton.isUserInteractionEnabled = true
            saveButton.backgroundColor = .init(hexString: "FF9500")
        } else {
            saveButton.isUserInteractionEnabled = false
            saveButton.backgroundColor = .init(hexString: "D1D1D6")
        }

    }
    @IBAction func actionButton(_ sender: Any) {
        let VC = DataDetailsViewController(nibName: "DataDetailsViewController", bundle: nil)
        VC.email = emaiTextfield.text ?? ""
        VC.password = passwordTextfield.text ?? ""
        VC.delegate = self
        self.navigationController?.pushViewController( VC, animated: true)
    }
}

extension DataPassingViewController: DataDetailsProtocol {
    func popView(message: String) {
        receiveDataTextfield.text = message
    }
}
