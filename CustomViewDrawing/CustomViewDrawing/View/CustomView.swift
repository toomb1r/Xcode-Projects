//
//  CustomView.swift
//  CustomViewDrawing
//
//  Created by wsucatslabs on 10/3/22.
//

import UIKit

class CustomView : UIView {
    //var angle = CGFloat.pi
    var percentDelta = -0.1
    var percent = CGFloat(0.0)
    var isAutoAnimating = false
    
    func startAutoAnimate() {
        isAutoAnimating = true
        update()
    }
    func update(){
        
        
        if(percent <= 0.001 || percent > 1.001){
            percentDelta *= -1.0
        }
        percent += percentDelta
        self.setNeedsDisplay()
        
    }
    override func draw(_ rect: CGRect) {
        var angle = CGFloat.pi * percent
        let center = CGPoint(x: bounds.midX, y: bounds.midY)
        let minDimmension = min(bounds.size.width, bounds.size.height)
        let path = UIBezierPath(arcCenter: center, radius: minDimmension * 0.5, startAngle: CGFloat.pi, endAngle: CGFloat.pi + angle, clockwise: true)
        path.lineWidth = 3.0
        path.addLine(to: center)
        
        if(angle < CGFloat.pi * 0.5) {
            UIColor.green.setFill()
        } else if (angle < CGFloat.pi * 0.75){
            UIColor.yellow.setFill()
        } else {
            UIColor.red.setFill()
        }
        
        path.fill()
        //#seizure warning
        //UIColor.green.setStroke() old code to color circle line green
        //path.stroke()
        if (isAutoAnimating) {
            DispatchQueue.main.async {
                self.update()
            }
        }
                
    }
}
