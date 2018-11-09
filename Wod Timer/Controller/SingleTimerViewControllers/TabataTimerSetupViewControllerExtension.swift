//
//  TabataTimerSetupViewControllerExtension.swift
//  Wod Timer
//
//  Created by Bryan Matzko on 2018-09-30.
//  Copyright © 2018 Bryan Matzko. All rights reserved.
//

import Foundation
import UIKit

extension TabataTimerSetupViewController: UIPickerViewDelegate, UIPickerViewDataSource
{
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        if pickerView == roundsPicker
        {
            return 2
        }
        else //pickerView == roundsPicker
        {
            return 4
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        if component == 0 && (pickerView == durationPicker || pickerView == restDurationPicker)
        {
            return selectedTimer.minutesPicker.count
        }
        else if component == 2
        {
            return selectedTimer.secondsPicker.count
        }
        else if component == 1 || component == 3
        {
            return 1
        }
        else //component == 0
        {
            return selectedTimer.roundsPicker.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        if component == 0 && (pickerView == durationPicker || pickerView == restDurationPicker)
        {
            return "\(selectedTimer.minutesPicker[row])"
        }
        else if component == 2
        {
            return "\(selectedTimer.secondsPicker[row])"
        }
        else if component == 0
        {
            return "\(selectedTimer.roundsPicker[row])"
        }
        else if component == 1 && pickerView == roundsPicker && row == 0
        {
            return "round"
        }
        else if component == 1
        {
            return "rounds"
        }
        else if component == 1
        {
            return "min"
        }
        else
        {
            return "sec"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        if component == 0 && pickerView == durationPicker
        {
            selectedTimer.durationWorkMinutes = minutesList[row]
        }
        else if component == 0 && pickerView == restDurationPicker
        {
            selectedTimer.durationRestMinutes = minutesList[row]
        }
        else if component == 0 && pickerView == roundsPicker
        {
            selectedTimer.rounds = roundsList[row]
            updateRoundsTextField()
            return
        }
        else if component == 2 && pickerView == durationPicker
        {
            selectedTimer.durationWorkSeconds = secondsList[row]
        }
        else if component == 2 && pickerView == restDurationPicker
        {
            selectedTimer.durationRestSeconds = secondsList[row]
        }
        
        updateTextField()
    }
    
    func updateRoundsTextField()
    {
        roundsTextField.text = "\(selectedTimer.rounds)"
    }
    
    func createTimeRepresentation(minutes: Int, seconds: Int, isDuration: Bool) -> String
    {
        var textField = String()
        
        if minutes == 0 && seconds == 0
        {
            if(isDuration)
            {
                durationPicker.selectRow(1, inComponent: 0, animated: true)
                selectedTimer.durationWorkMinutes = 1
            }
            else
            {
                restDurationPicker.selectRow(1, inComponent: 0, animated: true)
                selectedTimer.durationRestMinutes = 1
            }
            
            textField = "1 min"
        }
        else if seconds == 0
        {
            textField = "\(minutes) min"
        }
        else if minutes == 0
        {
            textField = "\(seconds) sec"
        }
        else
        {
            textField = "\(minutes) min \(seconds) sec"
        }
        
        return textField
    }
    
    func updateTextField()
    {
        //Picker associated text fields
        workDurationTextField.text = createTimeRepresentation(minutes: selectedTimer.durationWorkMinutes, seconds: selectedTimer.durationWorkSeconds, isDuration: true)
        restDurationTextField.text = createTimeRepresentation(minutes: selectedTimer.durationRestMinutes, seconds: selectedTimer.durationRestSeconds, isDuration: false)
        roundsTextField.text = "blooper"
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
        
        if component == 0 && pickerView == durationPicker
        {
            label.text = "\(minutesList[row])"
        }
        else if component == 0 && pickerView == roundsPicker
        {
            label.text = "\(roundsList[row])"
        }
        else if component == 1 && pickerView != roundsPicker
        {
            label.text = "min"
        }
        else if component == 1
        {
            label.text = "rounds" //How can i update this component when the other element changes?
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
