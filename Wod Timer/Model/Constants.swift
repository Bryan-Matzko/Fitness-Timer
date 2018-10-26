//
//  Constants.swift
//  Wod Timer
//
//  Created by Bryan Matzko on 2018-09-30.
//  Copyright © 2018 Bryan Matzko. All rights reserved.
//

import Foundation
import UIKit

struct colours
{
    static let blue         = UIColor(displayP3Red: 100.0/255.0, green: 163.0/255.0, blue: 232.0/255.0, alpha: 1.0)
    static let white        = UIColor(displayP3Red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0)
    static let black        = UIColor(displayP3Red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
    static let pink         = UIColor(displayP3Red: 208.0/255.0, green: 48.0/255.0, blue: 141.0/255.0, alpha: 1.0)
}

let timerTypes = [timerType(title: "AMRAP", instructions: "As Many Rounds as Possible for Time:", timer: TimersEnum.AmrapAndForTime),
                  timerType(title: "For Time", instructions: "As Fast as Possible for Time:", timer: TimersEnum.AmrapAndForTime),
                  timerType(title: "EMOM", instructions: "Every Minute on the Minute:", timer: TimersEnum.Emom),
                  timerType(title: "Tabata", instructions: "Interval Training:", timer: TimersEnum.Tabata)]

//Can't do both 0 minutes and 0 seconds
let minutesList = Array(0...120)
let secondsList = [0,10,20,30,40,50,60]
var roundsList = Array(1...60)

enum TimersEnum
{
    case AmrapAndForTime
    case Emom
    case Tabata
    case None
}
