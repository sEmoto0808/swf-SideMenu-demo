//
//  SideMenuProvider.swift
//  swf-SideMenu-demo
//
//  Created by S.Emoto on 2018/06/03.
//  Copyright © 2018年 S.Emoto. All rights reserved.
//

import UIKit

class SideMenuProvider: NSObject {
    
    let sideMenuList = ["1", "2", "3"]
    

}

extension SideMenuProvider: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SideMenuCell",for: indexPath) as! SideMenuCell
        
        cell.setTitle(title: sideMenuList[indexPath.row])
        cell.backgroundView?.backgroundColor = UIColor.blue
        
        return cell
    }
    
    
}
