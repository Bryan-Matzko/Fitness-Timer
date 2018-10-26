//
//  TimerWod.swift
//  Wod Timer
//
//  Created by Bryan Matzko on 2018-09-30.
//  Copyright © 2018 Bryan Matzko. All rights reserved.
//

import Foundation

class timerType
{
    //Identification
    var TimerId = TimersEnum.None
    
    //For display
    var Title = String()
    var Instructions = String()
    
    //Picker Setup
    var numPickerComponents = Int()
    var minutesPicker = minutesList
    var secondsPicker = secondsList
    var roundsPicker = roundsList
    
    //Timing Info
    var durationMinutes = Int()
    var durationSeconds = Int()
    var durationRestMinutes = Int()
    var durationRestSeconds = Int()
    var rounds = Int()
    
    var totalDurationSeconds = Int()
    
    init(title: String, instructions: String, timer: TimersEnum)
    {
        TimerId = timer
        Title = title
        Instructions = instructions
        
        //If we are creating a single running timer, set to 1
        if TimerId == TimersEnum.AmrapAndForTime
        {
            roundsPicker = [1]
            durationMinutes = 10
            durationSeconds = 0
        }
        if TimerId == TimersEnum.Emom || TimerId == TimersEnum.Tabata
        {
            durationMinutes = 1
            durationSeconds = 0
        }
    }
}
