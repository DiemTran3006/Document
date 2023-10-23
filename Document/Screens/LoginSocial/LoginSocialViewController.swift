//
//  LoginSocialViewController.swift
//  Document
//
//  Created by Diem Tran on 22/10/2023.
//

import UIKit
import FirebaseCore
import GoogleSignIn
import FBSDKLoginKit

class LoginSocialViewController: UIViewController {
      
    @IBOutlet weak var signInFacebook: FBLoginButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loginGoogleAction(_ sender: Any) {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config

        GIDSignIn.sharedInstance.signIn(withPresenting: self) { [unowned self] result, error in
            guard error == nil else {
                print("Error: ---\(error)")
                return
            }

            guard let user = result?.user,
                  let idToken = user.idToken?.tokenString else {
                return
            }
            print(idToken)

//            let credential = GoogleAuthProvider.credential(withIDToken: idToken,
//                                                           accessToken: user.accessToken.tokenString)

        }
    }
}
