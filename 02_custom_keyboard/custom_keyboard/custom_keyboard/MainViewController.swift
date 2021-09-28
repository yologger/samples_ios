//
//  ViewController.swift
//  custom_keyboard
//
//  Created by Hyukjung Kwon on 20/08/2020.
//  Copyright © 2020 yologger. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, CustomKeyBoardDelegate {

    @IBOutlet weak var textFieldForCustomKeyboard: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let xib = Bundle.main.loadNibNamed("CustomKeyboard", owner: nil, options: nil)
        let customKeyboard = xib?.first as! CustomKeyboard
        customKeyboard.delegate = self
        
        // Text Field의 Custom Keyboard 설정
        textFieldForCustomKeyboard.inputView = customKeyboard
    }

    func onKeyboardTapped(string: String) {
        let oldNumber = Int(textFieldForCustomKeyboard.text!)
        var newNumber = Int(string)
        
        if string == "00" && oldNumber != nil {
            newNumber = oldNumber! * 100
        }
        
        if let hasNumber = newNumber {
            textFieldForCustomKeyboard.text = String(describing: hasNumber)
        }
    }
}

