//
//  MenuVC.swift
//  ZARA
//
//  Created by 이윤진 on 2020/11/14.
//

import UIKit

class MenuVC: UIViewController {
    
    let menu: [String] = ["NEW IN","","COLLECTION","SHOES&BAGS","ZARASERIES","","CAMPAIGN","ARCHIVE","","","","","","","","JOINLIFE"]
    
    @IBOutlet weak var menuTV: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuTV.delegate = self
        menuTV.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = true
        
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(animated)
        
        self.navigationController?.isNavigationBarHidden = false
        
        
        
    }
    
    
    
}

extension MenuVC: UITableViewDelegate {
    
}

extension MenuVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTVCell",for: indexPath) as! MenuTVCell
        cell.setMenuTitle(menuName: menu[indexPath.row])
        return cell
    }
    
    
}
