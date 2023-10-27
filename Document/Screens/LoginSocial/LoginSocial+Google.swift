//
//  LoginSocial+Google.swift
//  Document
//
//  Created by Diem Tran on 25/10/2023.
//

import Foundation
import FirebaseAuth
import FirebaseCore
import GoogleSignIn

extension LoginSocialViewController {
    
    public func startSignInWithGoogleFlow() {
        //        Login google lấy " idToken và User "
        GIDSignIn.sharedInstance.signIn(withPresenting: self) { [weak self] result, error in
            guard let user = result?.user,
                  error == nil,
                  let self = self,
                  let idToken = user.idToken?.tokenString else {
                return
            }
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                           accessToken: user.accessToken.tokenString)
            //         Từ User lấy thông tin và gửi lên màn hình
            print(idToken)
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
}

