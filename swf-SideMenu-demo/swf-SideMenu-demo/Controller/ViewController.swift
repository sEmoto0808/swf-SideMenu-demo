//
//  ViewController.swift
//  swf-SideMenu-demo
//
//  Created by S.Emoto on 2018/06/03.
//  Copyright © 2018年 S.Emoto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var leftEdgeSwipe: UIScreenEdgePanGestureRecognizer!
    
    private var oneThirdOfScreen:CGFloat {
        return (self.view.frame.size.width/3 - self.view.frame.size.width)
    }
    
    var sideMenuViewController: SideMenuViewController!
    var contentViewController: UIViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
}

//MARK: - UIGestureRecognizerDelegate
extension ViewController:UIGestureRecognizerDelegate {
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool
    {
        if sideMenuViewController.isOpenSideMenu! == true {
            // サイドメニューを表示している間はスワイプ禁止
            return false
        }
        return true
    }
}

extension ViewController {
    
    private func setup() {
        
        leftEdgeSwipe.delegate = self
        setChildren()
    }
    
    private func setChildren() {
        
        let storyboard = UIStoryboard(name: "SideMenuViewController", bundle: nil)
        sideMenuViewController = storyboard.instantiateViewController(withIdentifier: "SideMenuViewController") as! SideMenuViewController
        
        self.addChildViewController(sideMenuViewController)
        self.view.addSubview(sideMenuViewController.view)
        sideMenuViewController.didMove(toParentViewController: self)
        sideMenuViewController.view.frame.origin.x = -UIScreen.main.bounds.width
    }
    
    //MARK: - Tap Side Menu Button
    @IBAction func sideMenuButton(_ sender: Any) {
        
        if sideMenuViewController.isOpenSideMenu! == false {
            sideMenuViewController.presentMenuViewController()
        } else {
            sideMenuViewController.dismissMenuViewController()
        }
    }
    
    //MARK: - Edge Swipe Gesture
    @IBAction func swipeLeftEdge(_ sender: UIScreenEdgePanGestureRecognizer) {
        sideMenuViewController.getEdgeGesture(sender: sender, menuShowMove: oneThirdOfScreen)
    }
}
