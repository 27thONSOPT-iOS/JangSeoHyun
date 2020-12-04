//
//  ViewController.swift
//  ZARA
//
//  Created by 이윤진 on 2020/11/14.
//

import UIKit

class MainVC: UIViewController {
    
    let image: [String] = ["proImg2","proImg2","rectangle9"]
    let tag: [String] = ["NEW","40% OFF","NEW"]
    let clothes: [String] = ["WOOL BLEND COAT WITH BELT","FAUX SHEARLINF COAT","CONTRAST PUFFER JACKET"]
    let price: [String] = ["219,000 원","219,000 원","219,000 원"]
    
    @IBOutlet weak var clothesCV: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavi()
        clothesCV.dataSource = self
        clothesCV.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func touchedMenuBtn(_ sender: Any) {
        
        guard let MenuVC = self.storyboard?.instantiateViewController(identifier:
                "MenuVC") as? MenuVC else { return }
        self.navigationController?.pushViewController(MenuVC, animated: true)
        
    }
    
}

extension MainVC: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    //MARK: - delegateflowlayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if (indexPath.row+1)%3 == 0 {
            return CGSize(width: collectionView.frame.size.width-28 , height: 400)
        }else{
            return CGSize(width: (collectionView.frame.size.width/2)-28 , height: 320)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 14, left: 14, bottom: 0, right: 14)
    }
    
    // MARK: - datasource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return clothes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ClothesCVCell.identifier, for: indexPath) as? ClothesCVCell else {
            return UICollectionViewCell()
        }
        cell.setImage(imageName: image[indexPath.row])
        cell.setTag(tag: tag[indexPath.row])
        cell.setClothesName(clothesName: clothes[indexPath.row])
        cell.setPrice(price: price[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) ->
    UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "ClothesCVHeader", for: indexPath)
            return headerView
        default:
            assert(false, "error")
        }
    }
    
}

extension MainVC{
    
    func setNavi() {
        
        self.navigationController?.navigationBar.barTintColor = .black // 네비게이션 바 색상 변경
        self.navigationController?.navigationBar.tintColor = .white // 네비게이션 바 텍스트 및 버튼 색상 변경
        // 네비게이션 바 title 설정 \
        self.navigationItem.title = "COATS"
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]

    }
}
