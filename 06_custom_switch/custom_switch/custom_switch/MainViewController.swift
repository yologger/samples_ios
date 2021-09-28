//
//  ViewController.swift
//  custom_switch
//
//  Created by Hyukjung Kwon on 21/08/2020.
//  Copyright © 2020 yologger. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var switchThumb: UIButton!
    @IBOutlet weak var switchBackground: UIView!
    
    @IBOutlet weak var buttonCenterX: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        switchThumb.layer.cornerRadius = switchThumb.frame.width / 2
        switchBackground.layer.cornerRadius = switchBackground.frame.height / 2
    }
    
    @IBAction func onButtonTapped(_ sender: Any) {
        if buttonCenterX.constant == -75 {
            buttonCenterX.constant = 75
            switchBackground.backgroundColor = UIColor.systemBlue
        } else {
            buttonCenterX.constant = -75
            switchBackground.backgroundColor = UIColor.lightGray
        }
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
}

