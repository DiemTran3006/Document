//
//  LoginSocialViewController.swift
//  Document
//
//  Created by Diem Tran on 22/10/2023.
//

import UIKit
import FirebaseAuth
import FirebaseCore
import GoogleSignIn
import FBSDKCoreKit
import FBSDKLoginKit
import AlamofireImage

class LoginSocialViewController: UIViewController {
    
    @IBOutlet weak var avatarView: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUser(name: "", email: "", avatarUrl: "")
    }
    
    private func setUser(name: String,
                         email: String,
                         avatarUrl: String) {
        nameLabel.text = name
        emailLabel.text = email
        if let url = URL(string: avatarUrl) {
            avatarView.af.setImage(withURL: url)
        }
    }
    
    @IBAction func loginFacebookAction(_ sender: Any) {
        let loginManager = LoginManager()
        loginManager.logIn(permissions: ["public_profile", "user_friends"],
                           from: self) { result, error in
            let parameters = ["fields": "id, name, email"]
            GraphRequest(graphPath: "me",
                         parameters: parameters).start { (connection, result, error) -> Void in
                guard error == nil,
                      let fbDetails = result as? NSDictionary else {
                    return
                }
                let name = fbDetails["name"] as? String
                let email = fbDetails["email"] as? String
                let id = fbDetails["id"] as? String
                self.getFacebookProfileImage(userID: id ?? "",
                                             name: name ?? "",
                                             email: email ?? "")
            }
        }
    }
    
    @IBAction func loginGoogleAction(_ sender: Any) {
        GIDSignIn.sharedInstance.signIn(withPresenting: self) { [weak self] result, error in
            guard let user = result?.user,
                  error == nil,
                  let self = self,
                  let idToken = user.idToken?.tokenString else {
                return
            }
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                           accessToken: user.accessToken.tokenString)
            Auth.auth().signIn(with: credential) { result, error in
                guard error == nil else {
                    return
                }
                
                let displayName = result?.user.displayName ?? ""
                let email = result?.user.email ?? ""
                let photoURL = result?.user.photoURL?.absoluteString ?? ""
                
                self.setUser(name: displayName, email: email, avatarUrl: photoURL)
            }
            
        }
    }
    
    private func getFacebookProfileImage(userID: String, name: String, email: String) {
        guard let facebookProfileImageURL = NSURL(string: "https://graph.facebook.com/\(userID)/picture?type=large") else { return }
        setUser(name: name, email: email, avatarUrl: facebookProfileImageURL.absoluteString ?? "")
    }
}
