//
//  APIDemoViewController.swift
//  Document
//
//  Created by Diem Tran on 27/10/2023.
//

import UIKit


class APIDemoViewController: UIViewController {
    
    @IBOutlet weak var serviceLoginLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Menu.callAPI.title
        settingAttrLabel()

    }
    
    private func settingAttrLabel() {
        let attrText = NSMutableAttributedString.getAttributedString(fromString: "By registering, you agree to our Terms of Service")
        attrText.apply(color: UIColor(hexString: "#294E68"), subString: "Terms of Service")
        serviceLoginLabel.attributedText = attrText
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapLabelProvision(tap:)))
        serviceLoginLabel.addGestureRecognizer(tap)
        serviceLoginLabel.isUserInteractionEnabled = true
    }
    @objc func tapLabelProvision(tap: UITapGestureRecognizer) {
    }
    
    @IBAction func loginGooogle(_ sender: Any) {
       
    }
    @IBAction func loginFacebook(_ sender: Any) {
  
    }
    
    @IBAction func loginApple(_ sender: Any) {
    }
    @IBAction func LoginInstagram(_ sender: Any) {
    }
    
    @IBAction func loginZalo(_ sender: Any) {
    }
    
    
    @IBAction func actionLogin(_ sender: Any) {
        let VC = LoginViewController(nibName: "LoginViewController", bundle: nil)
        self.navigationController?.pushViewController( VC, animated: true)
    }
}
