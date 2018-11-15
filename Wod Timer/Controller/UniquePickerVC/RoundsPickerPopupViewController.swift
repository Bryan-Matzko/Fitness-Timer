//
//  RoundsPickerPopupViewController.swift
//  Wod Timer
//
//  Created by Bryan Matzko on 2018-11-11.
//  Copyright © 2018 Bryan Matzko. All rights reserved.
//

import UIKit

class RoundsPickerPopupViewController: UIViewController
{
    @IBOutlet weak var roundsPicker: UIPickerView!
    @IBOutlet weak var doneButton: UIButton!
    
    var selectedTimer = timerType(title: String(), instructions: String(), timer: TimersEnum.none)
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
}
