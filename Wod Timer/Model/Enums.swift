//
//  Enums.swift
//  Wod Timer
//
//  Created by Bryan Matzko on 2018-10-27.
//  Copyright © 2018 Bryan Matzko. All rights reserved.
//

import Foundation

enum TimersEnum
{
    case amrap
    case forTime
    case emom
    case tabata
    case none
}

func convertTimersEnumToString(timerEnum : TimersEnum) -> String
{
    switch timerEnum
    {
    case TimersEnum.amrap:
        return "AMRAP"
    case TimersEnum.forTime:
        return "For Time"
    case TimersEnum.emom:
        return "EMOM"
    case TimersEnum.tabata:
        return "Tabata"
    default:
        return "None"
    }
}
