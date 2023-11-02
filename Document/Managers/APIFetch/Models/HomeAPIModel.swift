//
//  HomeAPIModel.swift
//  Document
//
//  Created by Diem Tran on 01/11/2023.
//

import Foundation

struct HomeAPIModel: Codable {
    let status: Int?
    let data: Data?
    let message: String?
}
struct DataModel: Codable {
    let id : Int?
    let product_id: String?
    let name: String?
    let image_url: String?
    let parent_id: Int?
    let product_variant: [ProducctModel]?
}
struct ProducctModel: Codable {
    let id: Int?
    let name: String?
    let order_display: Int?
    let product_type: Int?
    let title: String?
    let description: String?
    let img_url: String?
    let price: Int?
    let price_discount: Int?
    let currency_display: String?
    let intro_title: String?
    let intro_content: String?
    let layer_width: Int?
    let layer_height: Int?
    let phone_type: String?
    let link_video: String?
    let phone_top_position: Int?
    let phone_width: Int?
    let phone_height: String?
    let product_id: Int?
    let phone_case_type_id: Int?
    let phone_accessories_type: Int?
    let editor: [EditorModel]?
    let phone_case_type: PhoneTypeModel?
}
struct EditorModel: Codable {
    let image: String?
    let oder: Int?
  }
struct PhoneTypeModel: Codable {
    let id: Int?
    let name: String?
    let img_url: String?
}
