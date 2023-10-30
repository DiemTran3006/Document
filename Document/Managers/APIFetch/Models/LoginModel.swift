//
//  LoginModel.swift
//  Document
//
//  Created by Diem Tran on 29/10/2023.
//

import Foundation

// MARK: - LoginAPI
struct LoginRequest {
    let email: String
    let password: String
}
struct LoginModel: Codable {
    let id_user: Int
    let link_avatar: String
    let user_name: String
    let ip_register: String
    let device_register: String
    let email: String
    let count_comment: Int
    let count_sukien: Int
    let count_view: Int
}
