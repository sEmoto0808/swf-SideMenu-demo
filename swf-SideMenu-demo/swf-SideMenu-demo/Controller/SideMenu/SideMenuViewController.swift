//
//  SideMenuViewController.swift
//  swf-SideMenu-demo
//
//  Created by S.Emoto on 2018/06/03.
//  Copyright © 2018年 S.Emoto. All rights reserved.
//

import UIKit

class SideMenuViewController: UIViewController {

    @IBOutlet weak var sideTableView: UITableView!
    var isOpenSideMenu:Bool!
    
    private let dataSource = SideMenuProvider()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }    
}

extension SideMenuViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        dismissMenuViewController()
        
        let storyboardContent = UIStoryboard(name: "ContentViewController", bundle: nil)
        let contentViewController = storyboardContent.instantiateViewController(withIdentifier: "ContentViewController") as! ContentViewController
        present(contentViewController, animated: true, completion: nil)
    }
}


extension SideMenuViewController {
    
    private func setup() {
        
        isOpenSideMenu = false
        sideTableView.dataSource = dataSource
        
        sideTableView.tableFooterView = UIView()
    }
    
    //MARK: - Tap Side Menu Button
    func presentMenuViewController(){
        self.beginAppearanceTransition(true, animated: true)
        self.view.isHidden = false
        self.view.frame = self.view.frame.offsetBy(dx: -self.view.frame.size.width,
                                                   dy: 0)
        
        UIView.animate(withDuration: 0.3,
                       delay: 0,
                       usingSpringWithDamping: 0.8,
                       initialSpringVelocity: 0.3,
                       options: UIViewAnimationOptions.curveEaseOut,
                       animations: {
                        
                        let bounds = self.view.bounds
                        self.view.frame = CGRect(x:-bounds.size.width / 2,
                                                 y:0,
                                                 width:bounds.size.width,
                                                 height:bounds.size.height)
        },
                       completion: {_ in
                        self.endAppearanceTransition()
        })
        
        isOpenSideMenu = true
    }
    
    func dismissMenuViewController(){
        self.beginAppearanceTransition(false, animated: true)
        
        UIView.animate(withDuration: 0.3,
                       delay: 0,
                       options: .curveEaseOut,
                       animations: {
                        
                        self.view.frame = self.view.frame.offsetBy(dx: -self.view.bounds.size.width / 2,
                                                                   dy: 0)
        },
                       completion: {_ in
                        self.endAppearanceTransition()
        })
        
        isOpenSideMenu = false
    }
    
    //MARK: - Edge Swipe Gesture
    func getEdgeGesture(sender: UIScreenEdgePanGestureRecognizer, menuShowMove: CGFloat) {
        //移動量を取得する。
        let move:CGPoint = sender.translation(in: self.view)
        
        //画面の端からの移動量
        self.view.frame.origin.x += move.x
        
        //画面表示を更新する。
        //self.layoutIfNeeded()
        
        //ドラッグ終了時の処理
        if(sender.state == UIGestureRecognizerState.ended) {
            if(self.view.frame.origin.x > menuShowMove) {
                //ドラッグの距離が画面幅の1/3を超えた場合はメニューを出す
                UIView.animate(withDuration: 0.2,
                               animations: {
                                self.view.frame.origin.x = -UIScreen.main.bounds.width/2
                },
                               completion:nil)
                
                isOpenSideMenu = true
                //後述
                //clearView.isHidden = false
            } else {
                //ドラッグの距離が画面幅の1/3以下の場合はそのままメニューを右に戻す。
                UIView.animate(withDuration: 0.2,
                               animations: {
                                self.view.frame.origin.x = -UIScreen.main.bounds.width
                },
                               completion:nil)
                isOpenSideMenu = false
            }
        }
        //移動量をリセットする。
        sender.setTranslation(CGPoint.zero, in: self.view)
    }
}
