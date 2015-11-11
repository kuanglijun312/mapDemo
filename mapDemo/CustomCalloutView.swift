//
//  CustomCalloutView.swift
//  mapDemo
//
//  Created by zm002 on 15/10/27.
//  Copyright © 2015年 zm002. All rights reserved.
//

import UIKit

class CustomCalloutView: QPinAnnotationView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    var btn:UIButton!

    override func setSelected(selected: Bool, animated: Bool) {
        if selected {
            if btn == nil {
                btn = UIButton(frame: CGRectMake(10, -100, 200, 40))
                btn.setTitle("test", forState: UIControlState.Normal)
                btn.backgroundColor = UIColor.redColor()
                btn.addTarget(self, action: "tap:", forControlEvents: UIControlEvents.TouchUpInside)
            }
            self.addSubview(btn)
        } else {
            btn?.removeFromSuperview()
        }
        
        super.setSelected(selected, animated: animated)
    }
    
    func tap(sender:AnyObject) {
        print("tes")
    }
    
    override func hitTest(point: CGPoint, withEvent event: UIEvent?) -> UIView? {
        let hitView = super.hitTest(point, withEvent: event)
        if hitView != nil {
            self.superview?.bringSubviewToFront(self)
        }
        return hitView
    }
    
    override func pointInside(point: CGPoint, withEvent event: UIEvent?) -> Bool {
        let rect = self.bounds
        var isInSide = CGRectContainsPoint(rect, point)
        if !isInSide {
            if self.btn != nil {
                isInSide = CGRectContainsPoint(self.btn.frame, point)
            }
        }
        return isInSide
    }
}
