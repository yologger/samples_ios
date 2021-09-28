//
//  ViewController.swift
//  fab
//
//  Created by Hyukjung Kwon on 20/08/2020.
//  Copyright © 2020 yologger. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "popUpSegue" {
            let fabVC = segue.destination as! FABViewController
            fabVC.modalPresentationStyle = .overFullScreen
        }
    }
}

