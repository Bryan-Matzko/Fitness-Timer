//
//  CreateQueueFromTimer.swift
//  Wod Timer
//
//  Created by Bryan Matzko on 2018-10-26.
//  Copyright © 2018 Bryan Matzko. All rights reserved.
//

import Foundation

func createQueue(timerInfo: timerType) -> Queue<SecondsRepeatsPair>
{
    var returnQueue = Queue<SecondsRepeatsPair>()
    var totalSeconds = Int()
    
    if timerInfo.TimerId == TimersEnum.amrap || timerInfo.TimerId == TimersEnum.forTime
    {
        totalSeconds = timerInfo.durationWorkMinutes * 60 + timerInfo.durationWorkSeconds
        
        returnQueue.enqueue(SecondsRepeatsPair(secondsValue: totalSeconds, repeatsValue: 0))
    }
    else if timerInfo.TimerId == TimersEnum.emom
    {
        totalSeconds = timerInfo.durationWorkMinutes * 60 + timerInfo.durationWorkSeconds
        
        returnQueue.enqueue(SecondsRepeatsPair(secondsValue: totalSeconds, repeatsValue: timerInfo.rounds))
    }
    else if timerInfo.TimerId == TimersEnum.tabata
    {
        totalSeconds = timerInfo.durationWorkMinutes * 60 + timerInfo.durationWorkSeconds
        let totalRestSeconds = timerInfo.durationRestMinutes * 60 + timerInfo.durationRestSeconds
        
        for _ in 1...timerInfo.rounds
        {
            returnQueue.enqueue(SecondsRepeatsPair(secondsValue: totalSeconds, repeatsValue: 0, isWorkValue: true))
            returnQueue.enqueue(SecondsRepeatsPair(secondsValue: totalRestSeconds, repeatsValue: 0, isWorkValue: false))
        }
    }
    
    return returnQueue
}
