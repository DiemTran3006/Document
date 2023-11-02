//
//  LoginSocialManager.swift
//  Document
//
//

import UIKit
import FirebaseAuth

enum LoginSocialType {
    case FACEBOOK
    case GOOGLE
    case APPLE
    case ZALO
}

struct LoginSocialResponse {
    let name: String?
    let email: String?
    let photoUrl: String?
    let loginType: LoginSocialType
}

protocol LoginSocialProtocol: AnyObject {
    func loginSocialFailure(error: String)
    func loginSocialSuccessfully(response: LoginSocialResponse)
}

class LoginSocialManager: NSObject {
    static var shared: LoginSocialManager = LoginSocialManager()
    var currentNonce: String?
    var codeChallenage = ""
    var codeVerifier = ""
    weak var delegate: LoginSocialProtocol?
    
    init(delegate: LoginSocialProtocol? = nil) {
        self.delegate = delegate
    }
    
    func authenticateWithFirebase(credential: AuthCredential, 
                                  loginType: LoginSocialType) {
        Auth.auth().signIn(with: credential) { [weak self] authResult, error in
            guard error == nil, let self else { return }
            let response = LoginSocialResponse(name: authResult?.user.displayName, 
                                               email: authResult?.user.email,
                                               photoUrl: authResult?.user.photoURL?.absoluteString, 
                                               loginType: loginType)
            self.delegate?.loginSocialSuccessfully(response: response)
        }
    }
}
