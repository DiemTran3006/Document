//
//  LoginSocialViewController.swift
//  Document
//
//  Created by Diem Tran on 22/10/2023.
//

import UIKit
import Foundation
import FirebaseAuth
import FirebaseCore
import FBSDKCoreKit
import FBSDKLoginKit
import AlamofireImage
import AuthenticationServices

class LoginSocialViewController: UIViewController {
    
    @IBOutlet weak var avatarView: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    var currentNonce: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Menu.loginSocial.title
        setUser(name: "", email: "", avatarUrl: "")
    }
    
    public func setUser(name: String,
                         email: String,
                         avatarUrl: String) {
        nameLabel.text = name
        emailLabel.text = email
        if let url = URL(string: avatarUrl) {
            avatarView.af.setImage(withURL: url)
        }
    }
    
    @IBAction func loginFacebookAction(_ sender: Any) {
        startSignInWithFacebookFlow()
    }
    
    @IBAction func loginGoogleAction(_ sender: Any) {
        startSignInWithGoogleFlow()
    }
    
    @IBAction func loginAppleAction(_ sender: Any) {
        startSignInWithAppleFlow()
    }
}
