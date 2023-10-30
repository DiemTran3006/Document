//
//  RegisterModel.swift
//  Document
//
//  Created by Diem Tran on 29/10/2023.
//

import Foundation
// MARK: - RegisterAPI
struct RegisterRequest {
    let email: String
    let password: String
    let user_name: String
}
struct RegisterModel: Codable {
    let message : String
    let account: Data1
}
struct Data1: Codable {
    let email: String
}
