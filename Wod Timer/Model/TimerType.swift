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
    var TimerId = TimersEnum.none
    
    //For display
    var Title = String()
    var Instructions = String()
    
    //Picker Setup
    var minutesPicker = minutesList
    var secondsPicker = secondsList
    var roundsPicker = roundsList
    
    //duration of work
    var durationWorkMinutes = Int()
    var durationWorkSeconds = Int()
    
    //duration specific to a Tabata
    var durationRestMinutes = Int()
    var durationRestSeconds = Int()
    
    //Rounds for EMOMs and Tabata's
    var rounds = Int()
    
    init(title: String, instructions: String, timer: TimersEnum)
    {
        TimerId = timer
        Title = title
        Instructions = instructions
        
        //If we are creating a single running timer, set to 1
        if TimerId == TimersEnum.amrap || TimerId == TimersEnum.forTime
        {
            durationWorkMinutes = 10
            durationWorkSeconds = 0
        }
        if TimerId == TimersEnum.emom || TimerId == TimersEnum.tabata
        {
            durationWorkMinutes = 1
            durationWorkSeconds = 0
        }
    }
}
