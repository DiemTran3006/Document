//
//  LoginSocialViewController.swift
//  Document
//
//  Created by Diem Tran on 22/10/2023.
//

import UIKit
import Foundation
import AlamofireImage
import AuthenticationServices

class LoginSocialViewController: UIViewController {
    
    private let loginSocialManager = LoginSocialManager.shared
    
    @IBOutlet weak var avatarView: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginSocialManager.delegate = self
        setUser(user: .init(name: nil, email: nil, photoUrl: nil, loginType: .APPLE))
    }
    
    @IBAction func actionPopMenu(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func loginFacebookAction(_ sender: Any) {
        loginSocialManager.startSignInWithFacebookFlow(view: self)
    }
    
    @IBAction func loginGoogleAction(_ sender: Any) {
        loginSocialManager.startSignInWithGoogleFlow(view: self)
    }
    
    @IBAction func loginAppleAction(_ sender: Any) {
        loginSocialManager.startSignInWithAppleFlow(view: self)
    }
    
    private func setUser(user: LoginSocialResponse) {
        nameLabel.text = user.name
        emailLabel.text = user.email
        if let urlString = user.photoUrl, let url = URL(string: urlString) {
            avatarView.af.setImage(withURL: url)
        }
    }
}

extension LoginSocialViewController: LoginSocialProtocol {
    func loginSocialFailure(error: String) {
        print("error: \(error)")
    }
    
    func loginSocialSuccessfully(response: LoginSocialResponse) {
        setUser(user: response)
    }
}
