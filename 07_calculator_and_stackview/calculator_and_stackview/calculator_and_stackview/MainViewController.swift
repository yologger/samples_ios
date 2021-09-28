//
//  ViewController.swift
//  calculator_and_stackview
//
//  Created by Hyukjung Kwon on 22/08/2020.
//  Copyright © 2020 yologger. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    @IBOutlet weak var btn6: UIButton!
    @IBOutlet weak var btn7: UIButton!
    @IBOutlet weak var btn8: UIButton!
    @IBOutlet weak var btn9: UIButton!
    @IBOutlet weak var btn10: UIButton!
    @IBOutlet weak var btn11: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        resultLabel.layer.cornerRadius = 50
        resultLabel.layer.masksToBounds = true
        // resultLabel.layer.masksToBounds와 동일
        // resultLabel.clipsToBounds = true
        
        btn1.layer.cornerRadius = btn1.frame.width / 2
        btn2.layer.cornerRadius = btn2.frame.width / 2
        btn3.layer.cornerRadius = btn3.frame.width / 2
        btn4.layer.cornerRadius = btn4.frame.width / 2
        btn5.layer.cornerRadius = btn5.frame.width / 2
        btn6.layer.cornerRadius = btn6.frame.width / 2
        btn7.layer.cornerRadius = btn7.frame.width / 2
        btn8.layer.cornerRadius = btn8.frame.width / 2
        btn9.layer.cornerRadius = btn9.frame.width / 2
        btn10.layer.cornerRadius = btn10.frame.height / 2
        btn11.layer.cornerRadius = btn11.frame.width / 2
    }
}

