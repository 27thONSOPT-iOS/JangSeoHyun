//
//  HwanghoMainCVCell.swift
//  ZARA
//
//  Created by 송황호 on 2020/11/16.
//

import UIKit

class HwanghoMainCVCell: UICollectionViewCell {
    static let identifier = "HwanghoMainCVCell"
    
    @IBOutlet weak var dressImg: UIImageView!
    @IBOutlet weak var productTx: UILabel!
    @IBOutlet weak var nameTx: UILabel!
    @IBOutlet weak var orginPriceTx: UILabel!
    @IBOutlet weak var salePriceTx: UILabel!

    var filter = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        NotificationCenter.default.addObserver(self, selector: #selector(coatPressBtn), name: .init("coatPressBtn"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(puffersPressBtn), name: .init("puffersPressBtn"), object: nil)
    }
    // filter == 0
    @objc func viewAllPressBtn( _ notification: Notification) {
        guard let userinfo = notification.userInfo as?[String:Any] else {return }
        guard let fil = userinfo["filter"] as? Int else {return }
        self.filter = fil
        print("---> filter 받아옴 \(filter)")
    }
    // filter == 1
    @objc func coatPressBtn( _ notification: Notification) {
        guard let userinfo = notification.userInfo as?[String:Any] else {return }
        guard let fil = userinfo["filter"] as? Int else {return }
        self.filter = fil
        print("---> filter 받아옴 \(filter)")
    }
    // filter == 2
    @objc func puffersPressBtn( _ notification: Notification) {
        guard let userinfo = notification.userInfo as?[String:Any] else {return }
        guard let fil = userinfo["filter"] as? Int else {return }
        self.filter = fil
        print("---> filter 받아옴 \(filter)")
    }
    // filter == 3
    @objc func waistCoatsPressBtn( _ notification: Notification) {
        guard let userinfo = notification.userInfo as?[String:Any] else {return }
        guard let fil = userinfo["filter"] as? Int else {return }
        self.filter = fil
        print("---> filter 받아옴 \(filter)")
    }
    // filter == 4
    @objc func trenchCoatPressBtn( _ notification: Notification) {
        guard let userinfo = notification.userInfo as?[String:Any] else {return }
        guard let fil = userinfo["filter"] as? Int else {return }
        self.filter = fil
        print("---> filter 받아옴 \(filter)")
    }
    
    func setInformation(image: String, product: String, name: String, originalPrice : Int, salePrice: Int, filter: Int){

        if self.filter == filter{
            print("filter 값은?? \(self.filter)")
            self.dressImg.image = UIImage(named: image)
            self.productTx.text = product
            self.nameTx.text = name
            self.orginPriceTx.text = "\(originalPrice)"
            self.salePriceTx.text = "\(salePrice)"
        }
        else if self.filter == 0{
            print("filter 값은?? \(self.filter)")
            self.dressImg.image = UIImage(named: image)
            self.productTx.text = product
            self.nameTx.text = name
            self.orginPriceTx.text = "\(originalPrice)"
            self.salePriceTx.text = "\(salePrice)"
        }
    }
}
