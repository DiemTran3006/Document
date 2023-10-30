//
//  APIDemoViewController.swift
//  Document
//
//  Created by Diem Tran on 27/10/2023.
//

import UIKit


class APIDemoViewController: UIViewController {
    
    private let loginSocialManager = LoginSocialManager.shared
    
    @IBOutlet weak var serviceLoginLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
        self.navigationController?.interactivePopGestureRecognizer?.delegate = nil
        loginSocialManager.delegate = self
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
    }
    
    @IBAction func actionPopMenu(_ sender: Any) {
        let VC = HomeViewController(nibName: "HomeViewController", bundle: nil)
        self.navigationController?.pushViewController( VC, animated: true)
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
