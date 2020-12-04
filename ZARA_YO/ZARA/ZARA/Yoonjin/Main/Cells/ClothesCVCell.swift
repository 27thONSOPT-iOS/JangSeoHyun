//
//  ClothesCVCell.swift
//  ZARA
//
//  Created by 이윤진 on 2020/11/27.
//

import UIKit

class ClothesCVCell: UICollectionViewCell {
    
    @IBOutlet weak var clothesImageView: UIImageView!
    @IBOutlet weak var tagLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel! // 옷 이름
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var bookMarkBtn: UIButton!
    static let identifier = "ClothesCVCell"
    
    func setImage(imageName: String){
        clothesImageView.image = UIImage(named: imageName)
    }
    func setTag(tag: String){
     
        tagLabel.text = tag
        
    }
    func setClothesName(clothesName: String){
        nameLabel.text = clothesName
    }
    func setPrice(price: String){
        priceLabel.text = price
        
    }
    
    
}
