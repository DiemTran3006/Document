//
//  APIFetchHandler.swift
//  TestAPI
//
//  Created by Diem Tran on 29/10/2023.
//

import Foundation
import Alamofire

class APIFetchManager {
    static let shared = APIFetchManager()
    // MARK: - Api đăng kí
    func register(param: RegisterRequest,
                  handlerResponse: @escaping(_ apiData: RegisterModel) -> (Void),
                  handlerError: @escaping(_ error: String) -> (Void)) {
        let url = "https://sakaivn.online/register/user"
        let paramters: Parameters = [
            "email" : param.email,
            "password" : param.password,
            "user_name" : param.user_name,
            "link_avatar": param.link_avatar,
            "ip_register": param.ip_register,
            "device_register": param.device_register
        ]
        AF.request(url ,method: .post, parameters: paramters).response { response in
            switch response.result {
            case .success(let result):
                guard let result = result else {
                    handlerError("No Data")
                    return
                }
                do {
                    let jsonData = try JSONDecoder().decode(RegisterModel.self, from: result)
                    handlerResponse(jsonData)
                } catch {
                    handlerError(self.handleError(data: result))
                }
            case .failure(let error):
                handlerError(error.localizedDescription)
            }
        }
    }
    
    // MARK: - API đăng nhập
    func login(param: LoginRequest,
               handlerResponse: @escaping(_ apiData: LoginModel) -> (Void),
               handlerError: @escaping(_ error: String) -> (Void)) {
        let url = "https://sakaivn.online/login"
        let param: Parameters = [
            "email_or_username": param.email,
            "password": param.password
        ]
        AF.request(url,
                   method: .post,
                   parameters: param,
                   encoding: URLEncoding.default).response { result in
            switch result.result {
            case .success(let result):
                guard let result = result else {
                    handlerError("No Data")
                    return
                }
                do {
                    let jsonData = try JSONDecoder().decode(LoginModel.self, from: result)
                    handlerResponse(jsonData)
                } catch {
                    handlerError(self.handleError(data: result))
                }
            case .failure(let error):
                handlerError(error.localizedDescription)
            }
        }
    }
    
    // MARK: - resetPassword
    func resetPassword(param: ResetPassworResquest,
                       handlerResponse: @escaping(_ apiData: ResetPasswordModel) -> (Void),
                       handlerError: @escaping(_ error: String) -> (Void)) {
        let url = "https://sakaivn.online/reset"
        let param: Parameters = ["email": param.email]
        AF.request(url ,
                   method: .post,
                   parameters: param,
                   encoding: URLEncoding.default).response { result in
            switch result.result {
            case .success(let result):
                guard let result = result else {
                    handlerError("No Data")
                    return
                }
                do {
                    let jsonData = try JSONDecoder().decode(ResetPasswordModel.self, from: result)
                    handlerResponse(jsonData)
                } catch {
                    handlerError(self.handleError(data: result))
                }
            case .failure(let error):
                handlerError(error.localizedDescription)
            }
        }
    }
    // MARK: - upLoadImage
    func upLoadImage(param: UploadImageReques,
                     handlerResponse: @escaping(_ apiData: UploadImageModel) -> (Void),
                     handlerError: @escaping(_ error: String) -> (Void)) {
        let url = "https://api.imgbb.com/1/upload"
        let timestamp = Date().timeIntervalSince1970
        let parameters = ["key": param.key]
        guard let host = URLComponents(string: url) else {
            return
        }
        AF.upload(multipartFormData: { multipart in
            multipart.append(param.image,
                             withName: "image",
                             fileName: "\(timestamp)/image.jpg",
                             mimeType: "image/jpeg")
            for (key, value) in parameters {
                multipart.append(value.data(using: .utf8) ?? Data(), withName: key)
            }
        }, to: host,
                  usingThreshold: UInt64(),
                  method: .post)
        .uploadProgress(queue: .main, closure: { progress in
            print("Upload Progress: \(progress.fractionCompleted)")})
        .response { result in
            switch result.result {
            case .success(let result):
                guard let result = result else {
                    handlerError("No Data")
                    return
                }
                do {
                    let jsonData = try JSONDecoder().decode(UploadImageModel.self, from: result)
                    handlerResponse(jsonData)
                    print(jsonData)
                } catch {
                    handlerError(self.handleError(data: result))
                }
            case .failure(let error):
                handlerError(error.localizedDescription)
            }
        }
    }
    // MARK: - Xử lý lỗi
    private func handleError(data: Data) -> String {
        do {
            let jsonData = try JSONDecoder().decode(ErrorModel.self, from: data)
            return jsonData.message
        } catch {
            return "Parser model error"
        }
    }
}

struct ErrorModel: Codable {
    let message: String
}

