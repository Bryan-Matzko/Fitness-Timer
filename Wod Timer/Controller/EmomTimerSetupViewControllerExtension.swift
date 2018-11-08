//
//  EmomTimerSetupViewControllerExtension.swift
//  Wod Timer
//
//  Created by Bryan Matzko on 2018-09-30.
//  Copyright © 2018 Bryan Matzko. All rights reserved.
//

import Foundation
import UIKit

extension EmomTimerSetupViewController: UIPickerViewDelegate, UIPickerViewDataSource
{
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        if pickerView == durationPicker
        {
            return 4
        }
        else
        {
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        if component == 0 && pickerView == durationPicker
        {
            return selectedTimer.minutesPicker.count
        }
        else if component == 0 && pickerView == roundsPicker
        {
            return selectedTimer.roundsPicker.count
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
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        if component == 0 && pickerView == durationPicker
        {
            selectedTimer.durationWorkMinutes = selectedTimer.minutesPicker[row]
        }
        else if component == 0 && pickerView == roundsPicker
        {
            selectedTimer.rounds = selectedTimer.roundsPicker[row]
        }
        else if component == 2
        {
            selectedTimer.durationWorkSeconds = selectedTimer.secondsPicker[row]
        }
        
        updateTextField()
    }
    
    func updateTextField()
    {
        var text = String()
        let selectedMinutes = selectedTimer.durationWorkMinutes
        let selectedSeconds = selectedTimer.durationWorkSeconds
        
        if selectedMinutes == 0 && selectedSeconds == 0
        {
            durationPicker.selectRow(1, inComponent: 0, animated: true)
            selectedTimer.durationWorkMinutes = 1
            text = "\(1) min"
        }
        else if selectedSeconds == 0
        {
            text = "\(selectedMinutes) min"
        }
        else if selectedMinutes == 0
        {
            text = "\(selectedSeconds) sec"
        }
        else
        {
            text = "\(selectedMinutes) min \(selectedSeconds) sec"
        }
        
        intervalDurationTextField.text = text
        durationTextField.text = createTotalDurationFromRounds()
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView
    {
        var label = UILabel()
        
        if let view = view as? UILabel
        {
            label = view
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
            label.text = createTotalDurationFromRounds(row: row)
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
    
    func createTotalDurationFromRounds(row: Int) -> String
    {
        selectedTimer.rounds = selectedTimer.roundsPicker[row]
        
        return createTotalDurationFromRounds()
    }
    
    func createTotalDurationFromRounds() -> String
    {
        totalDurationSeconds = selectedTimer.rounds * (selectedTimer.durationWorkMinutes * 60 + selectedTimer.durationWorkSeconds)
        
        let totalMinutes = totalDurationSeconds / 60
        let totalSeconds = totalDurationSeconds % 60
        
        return createDurationString(totalMinutes: totalMinutes, totalSeconds: totalSeconds)
    }
    
    func createDurationString(totalMinutes: Int, totalSeconds: Int) -> String
    {
        if totalSeconds == 0
        {
            return "\(totalMinutes) min"
        }
        else if totalMinutes == 0
        {
            return "\(totalSeconds) sec"
        }
        else
        {
            return "\(totalMinutes) min \(totalSeconds) sec"
        }
    }
}
