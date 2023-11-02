//
//  APIDemoViewController.swift
//  Document
//
//  Created by Diem Tran on 27/10/2023.
//

import UIKit


class APIDemoViewController: BaseViewController {
    
    private let loginSocialManager = LoginSocialManager.shared
    
    @IBOutlet weak var serviceLoginLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginSocialManager.delegate = self
        settingAttrLabel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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
        loginSocialManager.startSignInWithGoogleFlow(view: self)
    }
    
    @IBAction func loginFacebook(_ sender: Any) {
        loginSocialManager.startSignInWithFacebookFlow(view: self)
    }
    
    @IBAction func loginApple(_ sender: Any) {
        loginSocialManager.startSignInWithAppleFlow(view: self)
    }
    

    @IBAction func LoginInstagram(_ sender: Any) {
        
    }
    
    @IBAction func loginZalo(_ sender: Any) {
        loginSocialManager.startSignInWithZaloFlow(view: self)
    }
    
    @IBAction func actionPopMenu(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func actionLogin(_ sender: Any) {
        let VC = LoginViewController(nibName: "LoginViewController", bundle: nil)
        self.navigationController?.pushViewController( VC, animated: true)
    }
}

extension APIDemoViewController: LoginSocialProtocol {
    func loginSocialFailure(error: String) {
        print("error: \(error)")
    }
    
    func loginSocialSuccessfully(response: LoginSocialResponse) {
        print(response)
    }
}
