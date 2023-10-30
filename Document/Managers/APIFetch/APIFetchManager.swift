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
    
    func register(param: RegisterRequest,
                  handlerResponse: @escaping(_ apiData: RegisterModel) -> (Void),
                  handlerError: @escaping(_ error: String) -> (Void)) {
        let url = "https://sakaivn.online/register/user"
        let paramters: Parameters = [
            "email" : param.email,
            "password" : param.password,
            "user_name" : param.user_name
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
                    handlerError(error.localizedDescription)
                }
            case .failure(let error):
                handlerError(error.localizedDescription)
            }
        }
    }
    
    func login(param: LoginRequest,
               handlerResponse: @escaping(_ apiData: LoginModel) -> (Void),
               handlerError: @escaping(_ error: String) -> (Void)) {
        let url = "https://sakaivn.online/login"
        let param: Parameters = [
            "email_or_username": "Demo123",
            "password": "Aa123456@"
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
                    handlerError(error.localizedDescription)
                }
            case .failure(let error):
                handlerError(error.localizedDescription)
            }
        }
    }
    func resetPassword(param: ResetPassworResquest,
                       handlerResponse: @escaping(_ apiData: ResetPasswordModel) -> (Void),
                       handlerError: @escaping(_ error: String) -> (Void)) {
        let url = "https://sakaivn.online/reset"
        let param: Parameters = ["email": param.email]
        AF.request(url , method: .post , parameters: param , encoding: URLEncoding.default).response { result in
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
                    handlerError(error.localizedDescription)
                }
            case .failure(let error):
                handlerError(error.localizedDescription)
            }
        }
    }
}
