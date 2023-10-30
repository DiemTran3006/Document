//
//  IPAddres.swift
//  Document
//
//  Created by Diem Tran on 30/10/2023.
//

import Foundation

struct IPAddress: Codable {
    let ip: String
    let city: String
    let region: String
    let country: String
    let loc: String
    let org: String
    let postal: String
    let timezone: String
    let readme: String
}
