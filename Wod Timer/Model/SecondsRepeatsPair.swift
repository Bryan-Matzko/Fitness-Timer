//
//  KeyValuePair.swift
//  Wod Timer
//
//  Created by Bryan Matzko on 2018-10-26.
//  Copyright © 2018 Bryan Matzko. All rights reserved.
//

import Foundation

struct SecondsRepeatsPair
{
    var seconds = Int()
    var repeats = Int()
    var isWork = Bool()
    
    init(secondsValue: Int, repeatsValue: Int, isWorkValue: Bool = true)
    {
        seconds = secondsValue
        repeats = repeatsValue
        isWork = isWorkValue
    }
}
