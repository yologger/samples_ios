//
//  CustomKeyboard.swift
//  custom_keyboard
//
//  Created by Hyukjung Kwon on 20/08/2020.
//  Copyright © 2020 yologger. All rights reserved.
//

import UIKit

protocol CustomKeyBoardDelegate {
    func onKeyboardTapped(string: String)
}

class CustomKeyboard: UIView {
     
    var delegate: CustomKeyBoardDelegate?
    
    @IBAction func onButtonTapped(_ sender: UIButton) {
        delegate?.onKeyboardTapped(string: sender.titleLabel!.text!)
    }
}
