//
//  DurationPickerPopupViewController.swift
//  Wod Timer
//
//  Created by Bryan Matzko on 2018-11-11.
//  Copyright © 2018 Bryan Matzko. All rights reserved.
//

import UIKit

class DurationPickerPopupViewController: UIViewController
{

    @IBOutlet weak var durationPicker: UIPickerView!
    @IBOutlet weak var doneButton: UIButton!
    
    var selectedTimer = timerType(title: String(), instructions: String(), timer: TimersEnum.none)
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        createDurationPicker()
    }
    
    
    func createDurationPicker()
    {
        durationPicker.delegate = self
        durationPicker.selectRow(10, inComponent: 0, animated: false)
        durationPicker.backgroundColor = .black
    }
    
    @IBAction func saveSelectionButtonClick(_ sender: Any)
    {
        NotificationCenter.default.post(name: .saveDurationPicker , object: self.selectedTimer)
        dismiss(animated: true)
    }
    
}
