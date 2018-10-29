//
//  UIViewExtension.swift
//  Wod Timer
//
//  Created by Bryan Matzko on 2018-09-30.
//  Copyright © 2018 Bryan Matzko. All rights reserved.
//

import Foundation
import UIKit

extension UIView
{
    func createButtonGradient(startColour: UIColor, endColour: UIColor)
    {
        roundEdges()
        layer.masksToBounds = true
        let gradient = CAGradientLayer()
        
        gradient.frame = bounds
        gradient.colors = [startColour.cgColor, endColour.cgColor]
        gradient.locations = [0.0, 0.4]
        
        
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.0)
        
        layer.insertSublayer(gradient, at: 0)
        
    }
    
    func styleStartButton(frameHeight: CGFloat)
    {
        frame = CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: self.frame.width, height: frameHeight/8)
    }
    
    func roundEdges()
    {
        layer.cornerRadius = self.frame.size.height/2
    }
    
    func styleTextFields()
    {
        layer.cornerRadius = self.frame.size.height/2
        layer.borderWidth = 1
        layer.borderColor = colours.pink.cgColor
    }
}
