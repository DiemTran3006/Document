//
//  LoginSocialManager+Apple.swift
//  Document
//
//  Created by Diem Tran on 25/10/2023.
//

import UIKit
import CryptoKit
import CommonCrypto
import FirebaseAuth
import FirebaseCore
import AuthenticationServices

extension LoginSocialManager  {
    
    public func startSignInWithAppleFlow(view: UIViewController) {
        let nonce = randomNonceString()
        currentNonce = nonce
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        request.nonce = sha256(nonce)
        
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
    }
    
    private func sha256(_ input: String) -> String {
        let inputData = Data(input.utf8)
        let hashedData = SHA256.hash(data: inputData)
        let hashString = hashedData.compactMap {
            String(format: "%02x", $0)
        }.joined()
        
        return hashString
    }
    
    private func randomNonceString(length: Int = 32) -> String {
        precondition(length > 0)
        var randomBytes = [UInt8](repeating: 0, count: length)
        let errorCode = SecRandomCopyBytes(kSecRandomDefault,
                                           randomBytes.count,
                                           &randomBytes)
        if errorCode != errSecSuccess {
            fatalError(
                "Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)"
            )
        }
        
        let charset: [Character] =
        Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
        
        let nonce = randomBytes.map { byte in
            charset[Int(byte) % charset.count]
        }
        
        return String(nonce)
    }
}

extension LoginSocialManager: ASAuthorizationControllerDelegate,
                              ASAuthorizationControllerPresentationContextProviding {
    
    func authorizationController(controller: ASAuthorizationController,
                                 didCompleteWithAuthorization authorization: ASAuthorization) {
        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
            guard let nonce = currentNonce else {
                fatalError("Trạng thái không hợp lệ: Đã nhận được lệnh gọi lại đăng nhập nhưng không có yêu cầu đăng nhập nào được gửi.")
            }
            guard let appleIDToken = appleIDCredential.identityToken else {
                print("Không thể tìm nạp mã thông báo nhận dạng")
                return
            }
            guard let idTokenString = String(data: appleIDToken, encoding: .utf8) else {
                print("Không thể tuần tự hóa chuỗi mã thông báo từ dữ liệu: \(appleIDToken.debugDescription)")
                return
            }
            // Khởi tạo thông tin xác thực Firebase, bao gồm tên đầy đủ của người dùng.
            let credential = OAuthProvider.appleCredential(withIDToken: idTokenString,
                                                           rawNonce: nonce,
                                                           fullName: appleIDCredential.fullName)
            authenticateWithFirebase(credential: credential, loginType: .APPLE)
        }
    }
    
    func authorizationController(controller: ASAuthorizationController,
                                 didCompleteWithError error: Error) {
        // Xử lý lỗi.
        print("Đăng nhập bằng Apple bị lỗi: \(error)")
    }
    
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        ASPresentationAnchor()
    }
}
