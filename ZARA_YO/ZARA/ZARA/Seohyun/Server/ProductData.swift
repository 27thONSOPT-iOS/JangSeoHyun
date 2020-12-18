//
//  ProductData.swift
//  ZARA
//
//  Created by 장서현 on 2020/12/16.
//

import Foundation

// MARK: - Datum
struct ProductData: Codable {
    let imgURL: String
    let originPrice: Int
    let isSale: Bool
    let sale: Sale
    let name, category: String

    enum CodingKeys: String, CodingKey {
        case imgURL = "imgUrl"
        case originPrice, isSale, sale, name, category
    }
}

// MARK: - Sale
struct Sale: Codable {
    let percent, discountedPrice: Int
}
