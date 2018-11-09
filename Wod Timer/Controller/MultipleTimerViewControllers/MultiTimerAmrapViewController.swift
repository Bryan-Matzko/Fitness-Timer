//
//  MultiTimerAmrapViewController.swift
//  Wod Timer
//
//  Created by Bryan Matzko on 2018-11-08.
//  Copyright © 2018 Bryan Matzko. All rights reserved.
//

import UIKit

class MultiTimerAmrapViewController: UIViewController
{
    @IBOutlet weak var durationPicker: UIPickerView!
    
    //Generic Timer To Setup
    var selectedTimer = timerType(title: String(), instructions: String(), timer: TimersEnum.none)
    
    var timerID = TimersEnum.amrap // or TimersEnum.fortime
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        createDurationPicker()
        selectedTimer = timerType(title: String(), instructions: String(), timer: timerID)
    }
    
    
    func createDurationPicker()
    {
        durationPicker.delegate = self
        durationPicker.selectRow(10, inComponent: 0, animated: false)
        durationPicker.backgroundColor = .black
    }
}
