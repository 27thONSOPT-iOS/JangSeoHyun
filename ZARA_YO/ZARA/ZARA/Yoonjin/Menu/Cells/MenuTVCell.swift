//
//  MenuTVCell.swift
//  ZARA
//
//  Created by 이윤진 on 2020/11/27.
//

import UIKit

class MenuTVCell: UITableViewCell {

    @IBOutlet weak var menuTitleLabel: UILabel!
    
    static let identifier = "MenuTVCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setMenuTitle(menuName: String){
        menuTitleLabel.text  = menuName
    }

}
