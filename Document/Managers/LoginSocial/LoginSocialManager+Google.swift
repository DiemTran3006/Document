//
//  LoginSocialManager+Google.swift
//  Document
//
//  Created by Diem Tran on 25/10/2023.
//

import Foundation
import FirebaseAuth
import FirebaseCore
import GoogleSignIn

extension LoginSocialManager {
    
    public func startSignInWithGoogleFlow(view: UIViewController) {
        //        Login google lấy " idToken và User "
        GIDSignIn.sharedInstance.signIn(withPresenting: view) { [weak self] result, error in
            guard let user = result?.user,
                  error == nil,
                  let self = self,
                  let idToken = user.idToken?.tokenString else {
                return
            }
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                           accessToken: user.accessToken.tokenString)
            self.authenticateWithFirebase(credential: credential, loginType: .GOOGLE)
        }
    }
}

