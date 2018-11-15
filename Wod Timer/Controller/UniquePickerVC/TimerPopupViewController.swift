 //
//  SelectMultipleTimerViewController.swift
//  Wod Timer
//
//  Created by Bryan Matzko on 2018-11-08.
//  Copyright © 2018 Bryan Matzko. All rights reserved.
//

import UIKit

class TimerPopupViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timerPicker: UIPickerView!
    @IBOutlet weak var makeSelectionButton: UIButton!
    
    var timerType = TimersEnum.forTime
    
    var timerPickerContents = ["For Time", "Amrap", "Emom", "Tabata"]
    var timerPickerTimerTypes = [TimersEnum.forTime, TimersEnum.amrap, TimersEnum.emom, TimersEnum.tabata]
    
    override func viewDidLoad()
    {
        timerPicker.delegate = self
        timerPicker.selectRow(0, inComponent: 0, animated: true)
        timerPicker.backgroundColor = .black
        
        super.viewDidLoad()
    }
    
    @IBAction func saveSelection(_ sender: Any)
    {
        NotificationCenter.default.post(name: .saveTimerType , object: self)
        dismiss(animated: true)
    }
}
