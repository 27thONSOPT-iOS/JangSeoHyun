//
//  menuVC.swift
//  ZARA
//
//  Created by 장서현 on 2020/12/04.
//

import UIKit

class menuVC: UIViewController {
    
    static let identifier = "menuVC"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func touchUpClose(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
