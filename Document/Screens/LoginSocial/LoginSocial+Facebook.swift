//
//  LoginSocial+Facebook.swift
//  Document
//
//  Created by Diem Tran on 25/10/2023.
//

import Foundation
import FirebaseAuth
import FirebaseCore
import FBSDKCoreKit
import FBSDKLoginKit

extension LoginSocialViewController {
    
    public func startSignInWithFacebookFlow() {
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
                print(fbDetails)
                let name = fbDetails["name"] as? String
                let email = fbDetails["email"] as? String
                let id = fbDetails["id"] as? String
                self.getFacebookProfileImage(userID: id ?? "",
                                             name: name ?? "",
                                             email: email ?? "")
            }
        }
    }
    
    private func getFacebookProfileImage(userID: String, name: String, email: String) {
        guard let facebookProfileImageURL = NSURL(string: "https://graph.facebook.com/\(userID)/picture?type=large") else { return }
        setUser(name: name, email: email, avatarUrl: facebookProfileImageURL.absoluteString ?? "")
    }
}
