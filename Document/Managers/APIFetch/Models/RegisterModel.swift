//
//  RegisterModel.swift
//  Document
//
//  Created by Diem Tran on 29/10/2023.
//

import Foundation

struct RegisterRequest {
    let email: String
    let password: String
    let user_name: String
    let ip_register: String
    let device_register: String
    let link_avatar: String
}
struct RegisterModel: Codable {
    let message : String
    let account: Data1
}
struct Data1: Codable {
    let email: String
}


