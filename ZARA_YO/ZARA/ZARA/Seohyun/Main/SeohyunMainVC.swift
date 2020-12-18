//
//  SeohyunMainVC.swift
//  ZARA
//
//  Created by 장서현 on 2020/12/16.
//

import UIKit

class SeohyunMainVC: UIViewController {
    
    @IBOutlet weak var MainCV: UICollectionView!
    
    var productInformation: GenericResponse<ProductData>?
    
//    let image: [String] = ["proImg2","proImg2","rectangle9"]
//    let proTitle: [String] = ["NEW","40% OFF","NEW"]
//    let name: [String] = ["WOOL BLEND COAT WITH BELT","FAUX SHEARLINF COAT","CONTRAST PUFFER JACKET"]
//    let price: [String] = ["219,000 원","149,000 원","109,000 원"]
    
    
    let horizonInset : CGFloat = 14.0
    let itemSpacing : CGFloat = 20.0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        getDataFromServer()
        MainCV.dataSource = self
        MainCV.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func getDataFromServer() {
        AuthService.shared.getProductData{
            networkResult in switch networkResult{
            case .success(let data):
                guard let dt = data as? ItemStruct else { return }
                self.productInformation = dt.result
            case .requestErr(_):
                print("requestErr")
            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
        }
    }
    
    @IBAction func touchUpMenu(_ sender: Any) {
        guard let menuVC = self.storyboard?.instantiateViewController(identifier: "menuVC") else{
            return
        }
        self.present(menuVC, animated: true, completion: nil)
    }
}

extension SeohyunMainVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCell.identifier, for: indexPath) as? HeaderCell else {return UICollectionReusableView()}
        
        return header
    }
    
    //cell size
    //row <-> section ?
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenHeight = UIScreen.main.bounds.height
        if (indexPath.row+1)%3 == 0 {
            let cellHeight = screenHeight * 400/812
            return CGSize(width: collectionView.frame.width, height: cellHeight)
        } else{
            let cellWidth = (collectionView.frame.width - horizonInset*2 - itemSpacing) / 2
            let cellHeight = screenHeight * 320/812
            return CGSize(width: cellWidth, height: cellHeight)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return itemSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: horizonInset, bottom: 0, right: horizonInset)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productInformation.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCell.identifier, for: indexPath) as? ItemCell else {
            return UICollectionViewCell()
        }
//        cell.setImage(imageName: image[indexPath.row])
//        cell.setTitle(proTitle: proTitle[indexPath.row])
//        cell.setName(name: name[indexPath.row])
//        cell.setPrice(price: price[indexPath.row])
        return cell
    }
    

}


