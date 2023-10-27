//
//  DataDetailsViewController.swift
//  Document
//
//  Created by Diem Tran on 24/10/2023.
//

import UIKit

protocol DataDetailsProtocol: AnyObject {
    func popView(message: String)
}

class DataDetailsViewController: UIViewController {
    
    var email = ""
    var password = ""

    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    weak var delegate: DataDetailsProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Menu.dataPassing.title
        emailLabel.text = "Email: \(email)"
        passwordLabel.text = "Password: \(password)"
        settingAttrLabel()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
       
    }
    
    @IBAction func transmittedDataButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        delegate?.popView(message: "Truyền lại Data: \(emailLabel.text!)")
    }
  private  func settingAttrLabel() {
        let attrText = NSMutableAttributedString.getAttributedString(fromString: "Password: \(password)")
        let attrText2 = NSMutableAttributedString.getAttributedString(fromString: "Email: \(email)")
        attrText.apply(color: UIColor(hexString: "#FFFFFF"), subString: password)
        attrText2.apply(color: UIColor(hexString: "#FFFFFF"), subString: email)
        passwordLabel.attributedText = attrText
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapLabelProvision(tap:)))
        passwordLabel.addGestureRecognizer(tap)
        passwordLabel.isUserInteractionEnabled = true
        
        emailLabel.attributedText = attrText2
        emailLabel.addGestureRecognizer(tap)
        emailLabel.isUserInteractionEnabled = true
    }
    @objc func tapLabelProvision(tap: UITapGestureRecognizer) {
    }
    
}
