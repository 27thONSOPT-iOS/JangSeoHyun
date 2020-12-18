//
//  ItemCell.swift
//  ZARA
//
//  Created by 장서현 on 2020/12/16.
//

import UIKit

class ItemCell: UICollectionViewCell {
    static let identifier = "ItemCell"
    
    @IBOutlet weak var pro_img: UIImageView!
    @IBOutlet weak var pro_title: UILabel!
    @IBOutlet weak var pro_name: UILabel!
    @IBOutlet weak var pro_price: UILabel!
    @IBOutlet weak var bookBtn: UIButton!
    var buttonActive = false
    
    @IBAction func bookBtnTapped(_ sender: Any) {
        if buttonActive {
            bookBtn.setBackgroundImage(UIImage(named: "icBookmarkFilled"), for: .normal)
        } else {
            bookBtn.setBackgroundImage(UIImage(named: "icBookmark"), for: .normal)
        }
        buttonActive = !buttonActive
    }
//    func setImage(imageName: String){
//        pro_img.image = UIImage(named: imageName)
//    }
//    func setTitle(proTitle : String){
//        pro_title.text = proTitle
//    }
//    func setName(name : String){
//        pro_name.text = name
//    }
//    func setPrice(price : String){
//        pro_price.text = price
//    }
}
