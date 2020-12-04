//
//  ItemCell1.swift
//  ZARA
//
//  Created by 장서현 on 2020/12/04.
//

import UIKit

class ItemCell1: UICollectionViewCell {
    static let identifier = "ItemCell1"
    
    @IBOutlet weak var pro_img: UIImageView!
    @IBOutlet weak var pro_title: UILabel!
    @IBOutlet weak var pro_name: UILabel!
    @IBOutlet weak var pro_price: UILabel!
    @IBOutlet weak var bookMarkBtn: UIButton!
    
//    func setImage(imageName: String){
//        pro_ImageView.image = UIImage(named: imageName)
//    }
    
//    func setCell(imageName: String, product: Product){
//        pro_ImageView.image = UIImage(named: imageName)
//        pro_title.text = product.title
//        pro_name.text = product.name
//        pro_price.text = product.price
//    }
}
