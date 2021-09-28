//
//  FABViewController.swift
//  fab
//
//  Created by Hyukjung Kwon on 20/08/2020.
//  Copyright © 2020 yologger. All rights reserved.
//

import UIKit

class FABViewController: UIViewController {
    @IBOutlet weak var btn1CenterY: NSLayoutConstraint!
    @IBOutlet weak var btn2CenterY: NSLayoutConstraint!
    @IBOutlet weak var btn3CenterY: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btn1CenterY.constant = 0
        btn2CenterY.constant = 0
        btn3CenterY.constant = 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //        UIView.animate(withDuration: 0.5) {
        //            self.btn1CenterY.constant = 80
        //            self.btn2CenterY.constant = 160
        //            self.btn3CenterY.constant = 240
        //            self.view.layoutIfNeeded()
        //        }
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            self.btn1CenterY.constant = 80
            self.btn2CenterY.constant = 160
            self.btn3CenterY.constant = 240
            self.view.layoutIfNeeded()  // 화면 갱신
        }) { (completion) in
        }
    }
    
    @IBAction func onButtonClicked(_ sender: Any) { 
        UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            self.btn1CenterY.constant = 0
            self.btn2CenterY.constant = 0
            self.btn3CenterY.constant = 0
            self.view.layoutIfNeeded()  // 화면 갱신
        }) { (completion) in
            self.dismiss(animated: false, completion: nil)
        }
    }
}
