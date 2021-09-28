//
//  ViewController.swift
//  graph_and_chart
//
//  Created by Hyukjung Kwon on 21/08/2020.

//  Copyright © 2020 yologger. All rights reserved.
//

import UIKit

extension NSLayoutConstraint {
    func changeMultiplier(value: CGFloat) -> NSLayoutConstraint {
        
        // 가지고 있는 constraint 전부를 비활성화
        NSLayoutConstraint.deactivate([self])
        
        let newLayoutConstaraint = NSLayoutConstraint.init(item: self.firstItem, attribute: self.firstAttribute, relatedBy: self.relation, toItem: self.secondItem, attribute: self.secondAttribute, multiplier: value, constant: self.constant)
        
        newLayoutConstaraint.priority = self.priority
        newLayoutConstaraint.shouldBeArchived = self.shouldBeArchived
        newLayoutConstaraint.identifier = self.identifier
        
        NSLayoutConstraint.activate([newLayoutConstaraint])
        
        return newLayoutConstaraint
    }
}
class MainViewController: UIViewController {
    
    @IBOutlet weak var bar1Height: NSLayoutConstraint!
    @IBOutlet weak var bar2Height: NSLayoutConstraint!
    @IBOutlet weak var bar3Height: NSLayoutConstraint!
    @IBOutlet weak var bar4Height: NSLayoutConstraint!
    @IBOutlet weak var bar5Height: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // constant 수정
        // bar1Height.constant = -100
        
        // priority 수정
        // bar1Height.priority = 200
        
        // multiplier는 getOnly라서 윗처럼 변경할 수 없다.
        // bar1Height.multipier = 0.5
        
        // mutlipier도 새로 새팅된 constraint를 새로 생성하는 코드를 extension을 사용해서 구현
        bar1Height = bar1Height.changeMultiplier(value: 0.5)
        bar2Height = bar2Height.changeMultiplier(value: 0.5)
        bar3Height = bar3Height.changeMultiplier(value: 0.5)
        bar4Height = bar4Height.changeMultiplier(value: 0.5)
        bar5Height = bar5Height.changeMultiplier(value: 0.5)
    }
    @IBAction func onIncrease(_ sender: Any) {
        UIView.animate(withDuration: 0.5) {
            self.bar1Height = self.bar1Height.changeMultiplier(value: 0.2)
            self.bar2Height = self.bar2Height.changeMultiplier(value: 0.4)
            self.bar3Height = self.bar3Height.changeMultiplier(value: 0.6)
            self.bar4Height = self.bar4Height.changeMultiplier(value: 0.8)
            self.bar5Height = self.bar5Height.changeMultiplier(value: 1.0)
            self.self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func onDecrease(_ sender: Any) {
        UIView.animate(withDuration: 0.5) {
            self.bar1Height = self.bar1Height.changeMultiplier(value: 1.0)
            self.bar2Height = self.bar2Height.changeMultiplier(value: 0.8)
            self.bar3Height = self.bar3Height.changeMultiplier(value: 0.6)
            self.bar4Height = self.bar4Height.changeMultiplier(value: 0.4)
            self.bar5Height = self.bar5Height.changeMultiplier(value: 0.2)
            self.self.view.layoutIfNeeded()
        }
    }
}

