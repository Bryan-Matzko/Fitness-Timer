//
//  DisplayHelpers.swift
//  Wod Timer
//
//  Created by Bryan Matzko on 2018-11-11.
//  Copyright © 2018 Bryan Matzko. All rights reserved.
//

import Foundation

func durationToString(min : Int, sec : Int) -> String
{
    if min == 0 && sec != 0
    {
        return "\(sec) sec"
    }
    else if min != 0 && sec == 0
    {
        return "\(min) min"
    }
    else if min != 0 && sec != 0
    {
        return "\(min) min \(sec) sec"
    }
    else
    {
        return ""
    }
}
