//
//  KeyValuePair.swift
//  Wod Timer
//
//  Created by Bryan Matzko on 2018-10-26.
//  Copyright © 2018 Bryan Matzko. All rights reserved.
//

import Foundation

struct SecondsRepeatPair
{
    var seconds = Int()
    var repeats = Int()
    
    init(secondsValue: Int, repeatsValue: Int = 0)
    {
        seconds = secondsValue
        repeats = repeatsValue
    }
}
