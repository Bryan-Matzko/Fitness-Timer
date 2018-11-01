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
    var minutesPicker = [Int]()
    var secondsPicker = [Int]()
    var roundsPicker = [Int]()
    
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
            
            minutesPicker = Array(0...120)
            secondsPicker = Array(0...3).map({ $0 * 15 })
        }
        else if TimerId == TimersEnum.emom
        {
            minutesPicker = Array(0...60)
            secondsPicker = Array(0...3).map({ $0 * 15 })
            roundsPicker = Array(1...60)
            
            durationWorkMinutes = 1
            durationWorkSeconds = 0
        }
        else if TimerId == TimersEnum.tabata
        {
            minutesPicker = Array(0...60)
            secondsPicker = Array(0...3).map({ $0 * 15 })
            roundsPicker = Array(1...60)
            
            durationWorkMinutes = 0
            durationWorkSeconds = 20
            durationRestMinutes = 0
            durationRestSeconds = 20
        }
    }
}
