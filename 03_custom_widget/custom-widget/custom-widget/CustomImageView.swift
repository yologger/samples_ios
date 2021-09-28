//
//  CustomImageView.swift
//  custom-widget
//
//  Created by Hyukjung Kwon on 21/08/2020.
//  Copyright © 2020 yologger. All rights reserved.
//
import UIKit

@IBDesignable
class CustomImageView: UIImageView {
    
    @IBInspectable var innerHeight: CGFloat = 0
    
    
    // 해당되는 오브젝트가 그려질 때 호출
    override func layoutSubviews() {
        makeMask()
    }
     
    func makePath() -> UIBezierPath {
        let path = UIBezierPath()
        // path.move(to: CGPoint.init(x: 0, y: 0))
        path.move(to: CGPoint.zero)
        path.addLine(to: CGPoint.init(x: self.bounds.width, y: 0))
        path.addLine(to: CGPoint.init(x: self.bounds.width, y: self.bounds.height))
        path.addLine(to: CGPoint.init(x: 0, y:self.bounds.height - innerHeight))
        path.close()
        return path
    }
    
    func pathToLayer() -> CAShapeLayer {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = makePath().cgPath
        return shapeLayer
    }
    
    func makeMask() {
        self.layer.mask = pathToLayer()
    }
}
