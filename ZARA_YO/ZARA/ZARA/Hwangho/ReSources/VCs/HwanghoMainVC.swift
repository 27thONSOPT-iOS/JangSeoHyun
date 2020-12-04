//
//  HwanghoMainVC.swift
//  ZARA
//
//  Created by 송황호 on 2020/11/14.
//

import UIKit

class HwanghoMainVC: UIViewController {

    @IBOutlet weak var zaraCollectionView: UICollectionView!
    
    var informations : [information] = []

    var filter = 0      // 0일 때는 전체 다 보여저야 함
    var count : Int?
    
    override func viewWillAppear(_ animated: Bool) {
        // filter = 0
        NotificationCenter.default.addObserver(self, selector: #selector(viewAllPressBtn), name: .init("viewAllPressBtn"), object: nil)
        // filter = 1
        NotificationCenter.default.addObserver(self, selector: #selector(coatPressBtn), name: .init("coatPressBtn"), object: nil)
        // filter = 2
        NotificationCenter.default.addObserver(self, selector: #selector(puffersPressBtn), name: .init("puffersPressBtn"), object: nil)
        // filter = 3
        NotificationCenter.default.addObserver(self, selector: #selector(waistCoatsPressBtn), name: .init("waistCoatsPressBtn"), object: nil)
        // filter = 4
        NotificationCenter.default.addObserver(self, selector: #selector(trenchCoatPressBtn), name: .init("trenchCoatPressBtn"), object: nil)
        
        
        setinformations()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        zaraCollectionView.delegate = self
        zaraCollectionView.dataSource = self
        zaraCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
    }
    // filter == 0
    @objc func viewAllPressBtn( _ notification: Notification) {
        guard let userinfo = notification.userInfo as?[String:Any] else {return }
        guard let fil = userinfo["filter"] as? Int else {return }
        self.filter = fil
        print("---> filter 받아옴 \(filter)")
        zaraCollectionView.reloadData()
    }
    // filter == 1
    @objc func coatPressBtn( _ notification: Notification) {
        guard let userinfo = notification.userInfo as?[String:Any] else {return }
        guard let fil = userinfo["filter"] as? Int else {return }
        self.filter = fil
        print("---> filter 받아옴 \(filter)")
        zaraCollectionView.reloadData()
    }
    // filter == 2
    @objc func puffersPressBtn( _ notification: Notification) {
        guard let userinfo = notification.userInfo as?[String:Any] else {return }
        guard let fil = userinfo["filter"] as? Int else {return }
        self.filter = fil
        print("---> filter 받아옴 \(filter)")
        zaraCollectionView.reloadData()
    }
    // filter == 3
    @objc func waistCoatsPressBtn( _ notification: Notification) {
        guard let userinfo = notification.userInfo as?[String:Any] else {return }
        guard let fil = userinfo["filter"] as? Int else {return }
        self.filter = fil
        print("---> filter 받아옴 \(filter)")
        zaraCollectionView.reloadData()
    }
    // filter == 4
    @objc func trenchCoatPressBtn( _ notification: Notification) {
        guard let userinfo = notification.userInfo as?[String:Any] else {return }
        guard let fil = userinfo["filter"] as? Int else {return }
        self.filter = fil
        print("---> filter 받아옴 \(filter)")
        zaraCollectionView.reloadData()
    }
    
    func setinformations(){
        let data1 = information(image: "proImg2", product: "NEW", name: "WOOL BLEND COAT WITH BELT", originalPrice: 4000, salePrice: 30000 , filter: 1)
        let data2 = information(image: "proImg2", product: "40% OFF", name: "FAUX SHEARLINF COAT", originalPrice: 234000, salePrice: 20000 , filter: 1)
        let data3 = information(image: "proImg2", product: "NEW", name: "CONTRAST PUFFER JACKET", originalPrice: 23400, salePrice: 12400 , filter: 2)
        let data4 = information(image: "proImg2", product: "30% OFF", name: "WOOL BLEND COAT WITH BELT", originalPrice: 53200, salePrice: 39000 , filter: 2)
        let data5 = information(image: "proImg2", product: "NEW", name: "FAUX SHEARLINF COAT", originalPrice: 42100, salePrice: 23100 , filter: 3)
        let data6 = information(image: "rectangle9", product: "NEW", name: "CONTRAST PUFFER JACKET", originalPrice: 52900, salePrice: 45200 , filter: 4)

        informations = [data1,data2,data3,data4,data5, data6]

    }
    
    // MENU 버튼
    @IBAction func menuPressBtn(_ sender: Any) {
        guard let VC = storyboard?.instantiateViewController(withIdentifier: HwanghoMenuVC.identifier) as? HwanghoMenuVC else {return }
        
        VC.modalPresentationStyle = .fullScreen
        present(VC, animated: true, completion: nil)
    }
}

// MARK: CollectionView DataSource 관련

extension HwanghoMainVC : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        

        if filter == 1 {
            return 2
        } else if filter == 2{
            return 2
        }else if filter == 3{
            return 1
        }else if filter == 4{
            return 1
        }else {
            return informations.count
        }
    }
    
    // Header Cell 집어 넣기
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = zaraCollectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HwanghoMainCVHeaderCell.identifier, for: indexPath) as? HwanghoMainCVHeaderCell else {return UICollectionReusableView()}
        
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // 전체 페이지
        guard let cell1 = zaraCollectionView.dequeueReusableCell(withReuseIdentifier: HwanghoMainCVCell.identifier, for: indexPath) as? HwanghoMainCVCell else {return UICollectionViewCell() }

            cell1.setInformation(image: informations[indexPath.row].image, product: informations[indexPath.row].product, name: informations[indexPath.row].name, originalPrice: informations[indexPath.row].originalPrice, salePrice: informations[indexPath.row].salePrice, filter: informations[indexPath.row].filter)
     
            return cell1
    }
}

// MARK: CollectionView Delegate FlowLayout 관련

extension HwanghoMainVC : UICollectionViewDelegateFlowLayout{
    
    // header Cell Size 관련
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let width : CGFloat = collectionView.frame.width
        let height : CGFloat = 40
        
        return CGSize(width: width, height: height)
    }
    
    // cell 가로 세로
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if (indexPath.row+1)%3 == 0 {
            return CGSize(width: collectionView.frame.size.width-28 , height: 400)
        }else{
            return CGSize(width: (collectionView.frame.size.width/2)-28 , height: 320)
        }
    }
    
    // cell 위 아래 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    // cell 좌,우 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    // collectionview contentsInset 지정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
    }
}

// MARK: CollectionView Delegate 관련

extension HwanghoMainVC : UICollectionViewDelegate{
    
}


