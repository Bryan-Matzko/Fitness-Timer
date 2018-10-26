//
//  TimerSetupViewControllerExtension.swift
//  Wod Timer
//
//  Created by Bryan Matzko on 2018-09-30.
//  Copyright © 2018 Bryan Matzko. All rights reserved.
//

import Foundation
import UIKit

extension SingleDurationTimerSetupViewController: UIPickerViewDelegate, UIPickerViewDataSource
{
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        if selectedTimer.TimerId == TimersEnum.AmrapAndForTime
        {
            
        }
        return 4
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        if component == 0
        {
            return selectedTimer.minutesPicker.count
        }
        else if component == 1 || component == 3
        {
            return 1
        }
        else
        {
            return selectedTimer.secondsPicker.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        if component == 0
        {
            return "\(selectedTimer.minutesPicker[row])"
        }
        else if component == 1
        {
            return "min"
        }
        else if component == 2
        {
            return "\(selectedTimer.secondsPicker[row])"
        }
        else
        {
            return "sec"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0
        {
            selectedTimer.durationMinutes = minutesList[row]
        }
        else if component == 2
        {
            selectedTimer.durationSeconds = secondsList[row]
        }
        
        updateTextField()
    }
    
    func updateTextField()
    {
        var textField = String()
        var selectedMinutes = selectedTimer.durationMinutes
        let selectedSeconds = selectedTimer.durationSeconds
        
        if selectedMinutes == 0 && selectedSeconds == 0
        {
            durationPicker.selectRow(1, inComponent: 0, animated: true)
            selectedMinutes = 1
            selectedTimer.durationMinutes = 1
            textField = "\(selectedMinutes) min"
        }
        else if selectedSeconds == 0
        {
            textField = "\(selectedMinutes) min"
        }
        else if selectedMinutes == 0
        {
            textField = "\(selectedSeconds) sec"
        }
        else
        {
            textField = "\(selectedMinutes) min \(selectedSeconds) sec"
        }
        
        singleTimerDurationTextField.text = textField
        selectedTimer.totalDurationSeconds = selectedTimer.durationMinutes * 60 + selectedTimer.durationSeconds
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView
    {
        var label = UILabel()
        
        if let view = view as? UILabel
        {
            label = view
        }
        else
        {
            label = UILabel()
        }
        
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: "Helvetica Neue", size: 20)
        
        if component == 0
        {
            label.text = "\(minutesList[row])"
        }
        else if component == 1
        {
            label.text = "min"
        }
        else if component == 2
        {
            label.text = "\(secondsList[row])"
        }
        else
        {
            label.text = "sec"
        }
        return label
    }
}
