//
//  LoginSocialManager+Facebook.swift
//  Document
//
//  Created by Diem Tran on 25/10/2023.
//

import Foundation
import FirebaseAuth
import FirebaseCore
import FBSDKCoreKit
import FBSDKLoginKit

extension LoginSocialManager {
    
    public func startSignInWithFacebookFlow(view: UIViewController) {
        let loginManager = LoginManager()
        loginManager.logIn(permissions: ["public_profile"],
                           from: view) { [weak self] result, error in
            guard let self else { return }
            if let error = error {
                self.delegate?.loginSocialFailure(error: "Encountered Erorr: \(error)")
            } else if let result = result, result.isCancelled {
                self.delegate?.loginSocialFailure(error: "Cancelled")
            } else {
                print("Logged In")
                let idTokenString = AuthenticationToken.current?.tokenString
                let nonce = currentNonce
                let credential = OAuthProvider.credential(withProviderID: "facebook.com",
                                                          idToken: idTokenString!,
                                                          rawNonce: nonce)
                self.authenticateWithFirebase(credential: credential, loginType: .FACEBOOK)
                print(idTokenString ?? "")
            }
        }
    }
    
    private func getFacebookProfileImage(userID: String, name: String, email: String) {
        guard let facebookProfileImageURL = NSURL(string: "https://graph.facebook.com/\(userID)/picture?type=large") else { return }
        //        setUser(name: name, email: email, avatarUrl: facebookProfileImageURL.absoluteString ?? "")
    }
}
