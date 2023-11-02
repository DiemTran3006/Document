//
//  UploadImageModel.swift
//  Document
//
//  Created by Diem Tran on 31/10/2023.
//

import Foundation


struct UploadImageReques {
    let image: Data
    let key: String
}

struct UploadImageModel: Codable {
    let data : dataDocumet
}

struct dataDocumet: Codable {
    let url: String
    let id: String
}
