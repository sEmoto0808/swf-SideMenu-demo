//
//  SideMenuCell.swift
//  swf-SideMenu-demo
//
//  Created by S.Emoto on 2018/06/03.
//  Copyright © 2018年 S.Emoto. All rights reserved.
//

import UIKit

class SideMenuCell: UITableViewCell {

    @IBOutlet weak var sideMenuTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setTitle(title: String) {
        
        sideMenuTitle.textAlignment = NSTextAlignment.right
        sideMenuTitle.text = title
        self.contentView.backgroundColor = UIColor.blue
    }
}
