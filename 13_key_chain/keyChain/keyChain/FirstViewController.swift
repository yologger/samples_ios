//
//  ViewController.swift
//  keyChain
//
//  Created by Hyukjung Kwon on 23/10/2020.
//  Copyright © 2020 yologger. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var accessTokenTextField: UITextField!
    @IBOutlet weak var refreshTokenTextField: UITextField!
    
    let bundleId = Bundle.main.bundleIdentifier
    let tokenService = TokenService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func onSaved(_ sender: Any) {
        tokenService.save(bundleId!, account: "accessToken", value: accessTokenTextField.text!)
        tokenService.save(bundleId!, account: "refreshToken", value: refreshTokenTextField.text!)
    }
}

