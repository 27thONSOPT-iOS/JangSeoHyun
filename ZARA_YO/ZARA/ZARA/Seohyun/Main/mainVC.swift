//
//  mainVC.swift
//  ZARA
//
//  Created by 장서현 on 2020/12/02.
//

import UIKit

class mainVC: UIViewController {
    
    @IBOutlet weak var MainCollectionView: UICollectionView!
    
    let horizonInset : CGFloat = 14.0
    let itemSpacing : CGFloat = 20.0
    
    var product: [Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setProData()
        MainCollectionView.delegate = self
        MainCollectionView.dataSource = self
        customNavigation()
    }
    
    func setProData(){
        product.append(contentsOf: [
            Product(title: "NEW", name: "WOOL BLEND COAT WITH BELT", price: "219,000원"),
            Product(title: "40% OFF", name: "FAUX SHEARLINF COAT", price: "149,000원"),
            Product(title: "NEW", name: "CONTRAST PUFFER JACKET", price: "109,000원")
        ])
    }
    
    @IBAction func touchUpMenu(_ sender: Any) {
        guard let menuVC = self.storyboard?.instantiateViewController(identifier: "menuVC") else{
            return
        }
        self.present(menuVC, animated: true, completion: nil)
    }
}

extension mainVC : UICollectionViewDataSource{
    //section 개수 지정
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    //section별 아이템 개수 지정
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0{
            return 1
        }
        else if section == 1{
            return 2
        }
        return 1
    }
    
    //section별 cell 지정
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HeaderCell", for: indexPath)
            return cell
        }
        else if indexPath.section == 1{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell1", for: indexPath)
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell2", for: indexPath)
        return cell
    }
}

extension mainVC : UICollectionViewDelegateFlowLayout{
    
    //section별 cell 크기 지정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenHeight = UIScreen.main.bounds.height
        
        if indexPath.section == 0{
            let cellHeight = 40/812*screenHeight
            return CGSize(width: collectionView.frame.width, height: cellHeight)
        }
        else if indexPath.section == 1{
            let cellHeight = 320/812*screenHeight
            let cellWidth = (collectionView.frame.width - horizonInset*2 - itemSpacing)/2
            return CGSize(width: cellWidth, height: cellHeight)
        }
        let cellHeight = 400/812*screenHeight
        return CGSize(width: collectionView.frame.width, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if section == 1{
            return itemSpacing
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if section == 1{
            return UIEdgeInsets(top: 0, left: horizonInset, bottom: 0, right: horizonInset)
        }
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}

extension mainVC{
    func customNavigation(){
        self.navigationController?.navigationBar.barTintColor = UIColor.black
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white,.font: UIFont(name: "Arial", size: 14)]
        self.navigationItem.title="COATS"
        
        self.navigationController?.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "icArrow"), style: .plain, target: self, action: nil)
        
        self.navigationController?.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "icHeart"), style: .plain, target: self, action: nil)
    }
}
