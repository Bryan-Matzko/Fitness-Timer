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
        else //pickerView == roundsPicker
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
        if component == 0 && pickerView == durationPicker
        {
            return "\(selectedTimer.minutesPicker[row])"
        }
        else if component == 0 && pickerView == roundsPicker
        {
            return createTotalDurationFromRounds(row: row)
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
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        if component == 0 && pickerView == durationPicker
        {
            selectedTimer.durationMinutes = minutesList[row]
        }
        else if component == 0 && pickerView == roundsPicker
        {
            selectedTimer.rounds = selectedTimer.roundsPicker[row]
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
        
        intervalDurationTextBox.text = textField
        durationTextBox.text = createTotalDurationFromRounds()
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
        let durationAsDecimal = Double(selectedTimer.rounds) * (Double(selectedTimer.durationMinutes) + Double(selectedTimer.durationSeconds) / 60.0)
        
        let totalMinutes = floor(durationAsDecimal)
        let totalSeconds = (durationAsDecimal - totalMinutes) * 60
        
        selectedTimer.totalDurationSeconds = Int(totalMinutes * 60 + totalSeconds)
        
        return createDurationString(totalMinutes: totalMinutes, totalSeconds: totalSeconds)
    }
    
    func createDurationString(totalMinutes: Double, totalSeconds: Double) -> String
    {
        return createDurationString(totalMinutes: Int(totalMinutes), totalSeconds: Int(totalSeconds))
    }
    
    func createDurationString(totalMinutes: Int, totalSeconds: Int) -> String
    {
        if totalMinutes == 0
        {
            return "\(totalSeconds) sec"
        }
        else if totalSeconds == 0
        {
            return "\(totalMinutes) min"
        }
        else
        {
            return "\(totalMinutes) min \(totalSeconds) sec"
        }
    }
}
