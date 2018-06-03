//
//  ContentViewController.swift
//  swf-SideMenu-demo
//
//  Created by S.Emoto on 2018/06/03.
//  Copyright © 2018年 S.Emoto. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension ContentViewController {
    
    @IBAction func didTapDismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
