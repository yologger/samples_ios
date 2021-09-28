//
//  ViewController.swift
//  popup
//
//  Created by Hyukjung Kwon on 22/08/2020.
//  Copyright © 2020 yologger. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func showPopUp(_ sender: Any) {
        let popUpStoryBoard = UIStoryboard.init(name: "PopupViewController", bundle: nil)
        let popUpViewController = popUpStoryBoard.instantiateViewController(withIdentifier: "popup_view_controller_id")
        
        popUpViewController.modalPresentationStyle = .overCurrentContext
        
        self.present(popUpViewController, animated: false, completion: nil)
        
    }
}

