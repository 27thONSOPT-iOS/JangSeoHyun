//
//  HwanghoMenuVC.swift
//  ZARA
//
//  Created by 송황호 on 2020/11/15.
//

import UIKit

class HwanghoMenuVC: UIViewController {

    static let identifier = "HwanghoMenuVC"

    @IBOutlet weak var womanBtn: UIButton!
    @IBOutlet weak var manBtn: UIButton!
    @IBOutlet weak var kidsBtn: UIButton!
    @IBOutlet weak var womanUnderBar: UIView!
    @IBOutlet weak var manUnderBar: UIView!
    @IBOutlet weak var kidsUnderBar: UIView!
    
    override func viewWillAppear(_ animated: Bool) {
        womanBtn.addTarget(self, action: #selector(womanPressBtn), for: .touchUpInside)
        manBtn.addTarget(self, action: #selector(manPressBtn), for: .touchUpInside)
        kidsBtn.addTarget(self, action: #selector(kidsPressBtn), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manUnderBar.isHidden = true
        kidsUnderBar.isHidden = true

    }
    
    @IBAction func backPressBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func womanPressBtn(){
        self.womanBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        self.manBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        self.kidsBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        
        womanUnderBar.isHidden = false
        manUnderBar.isHidden = true
        kidsUnderBar.isHidden = true
    }
    @objc func manPressBtn(){
        self.womanBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        self.manBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        self.kidsBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        
        womanUnderBar.isHidden = true
        manUnderBar.isHidden = false
        kidsUnderBar.isHidden = true
    }
    @objc func kidsPressBtn(){
        self.womanBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        self.manBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        self.kidsBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        
        womanUnderBar.isHidden = true
        manUnderBar.isHidden = true
        kidsUnderBar.isHidden = false
    }
}

//
//trenchCoatBtn.addTarget(self, action:  #selector(trenchCoatPressBtn), for: .touchUpInside)
//}
//
//@objc func viewAllPressBtn() {
//filters = 0
//print("viewAllPressBtn 눌렀음 \(filters)")
//NotificationCenter.default.post(name: .init("viewAllPressBtn"), object: nil, userInfo: ["filter":filters])
//}
