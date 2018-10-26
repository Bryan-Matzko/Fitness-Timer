//
//  Queue.swift
//  Wod Timer
//
//  Created by Bryan Matzko on 2018-10-26.
//  Copyright © 2018 Bryan Matzko. All rights reserved.
//

import Foundation

struct Queue<T> {
    var list = [T]()
    
    mutating func enqueue(_ element: T)
    {
        list.append(element)
    }
    
    mutating func dequeue() -> T?
    {
        if !list.isEmpty
        {
            return list.removeFirst()
        }
        else
        {
            return nil
        }
    }
    
    func peek() -> T?
    {
        if !list.isEmpty
        {
            return list[0]
        }
        else
        {
            return nil
        }
    }
    
    func isEmpty() -> Bool
    {
        return list.isEmpty
    }
}
