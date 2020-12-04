//
//  information.swift
//  ZARA
//
//  Created by 송황호 on 2020/11/16.
//

import Foundation

// 구조체
struct information {
    let image : String
    let product : String
    let name : String
    let originalPrice : Int
    let salePrice : Int
    let filter : Int
    
    init(image: String, product : String, name: String, originalPrice:Int, salePrice : Int, filter : Int) {
        self.image = image
        self.product = product
        self.name = name
        self.originalPrice = originalPrice
        self.salePrice = salePrice
        self.filter = filter
    }
}
