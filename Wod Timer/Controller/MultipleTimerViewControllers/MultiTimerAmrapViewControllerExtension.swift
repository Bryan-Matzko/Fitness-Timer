//
//  MultiTimerAmrapViewControllerExtension.swift
//  Wod Timer
//
//  Created by Bryan Matzko on 2018-11-08.
//  Copyright © 2018 Bryan Matzko. All rights reserved.
//

import Foundation
import UIKit

extension MultiTimerAmrapViewController: UIPickerViewDelegate, UIPickerViewDataSource
{
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 4
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        if component == 0
        {
            return selectedTimer.minutesPicker.count
        }
        else if component == 2
        {
            return selectedTimer.secondsPicker.count
        }
        else
        {
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0
        {
            selectedTimer.durationWorkMinutes = minutesList[row]
        }
        else if component == 2
        {
            selectedTimer.durationWorkSeconds = secondsList[row]
        }
        updateTextField()
    }
    
    func updateTextField()
    {
        var textField = String()
        let selectedMinutes = selectedTimer.durationWorkMinutes
        let selectedSeconds = selectedTimer.durationWorkSeconds
        
        if selectedMinutes == 0 && selectedSeconds == 0
        {
            durationPicker.selectRow(1, inComponent: 0, animated: true)
            selectedTimer.durationWorkMinutes = 1
            textField = "1 min"
        }
        else if selectedSeconds == 0
        {
            textField = "\(selectedMinutes) min"
        }
        else if selectedMinutes == 0
        {
            textField = "\(selectedSeconds) sec"
        }
        else if selectedMinutes == selectedTimer.minutesPicker[selectedTimer.minutesPicker.count-1]
        {
            selectedTimer.durationWorkSeconds = 0
            durationPicker.selectRow(0, inComponent: 2, animated: true)
            textField = "\(selectedMinutes) min"
        }
        else
        {
            textField = "\(selectedMinutes) min \(selectedSeconds) sec"
        }
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
        
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: "Helvetica Neue", size: 20)
        return label
    }
}
