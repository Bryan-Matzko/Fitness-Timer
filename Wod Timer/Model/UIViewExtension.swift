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
        let gradient = CAGradientLayer()
        
        gradient.frame = bounds
        gradient.colors = [startColour.cgColor, endColour.cgColor]
        gradient.locations = [0.0, 0.4]
        
        
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.0)
        
        layer.insertSublayer(gradient, at: 0)
    }
}
