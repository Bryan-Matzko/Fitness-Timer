//
//  RunTimerViewController.swift
//  Wod Timer
//
//  Created by Bryan Matzko on 2018-09-30.
//  Copyright © 2018 Bryan Matzko. All rights reserved.
//

import UIKit

class RunTimerViewController: UIViewController
{
    @IBOutlet weak var timeLabel: UILabel!
    
    var seconds: Int = 60
    var timer = Timer()
    var isTimerRunning = false
    var resumeTapped = false
    
    var secondsDefault = Int()
    var roundsOfSecondsDefault = Int()
    
    var selectedTimer = timerType(title: String(), instructions: String(), timer: TimersEnum.None)
    var queuedTimes = Queue<SecondsRepeatPair>()
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        queuedTimes.enqueue(SecondsRepeatPair(secondsValue: 5, repeatsValue: 0))
        queuedTimes.enqueue(SecondsRepeatPair(secondsValue: 10, repeatsValue: 0))
        queuedTimes.enqueue(SecondsRepeatPair(secondsValue: 4, repeatsValue: 2))
        
        //Set current value of our timer
        let dequeuedItem = queuedTimes.dequeue()
        secondsDefault = dequeuedItem!.seconds
        roundsOfSecondsDefault = dequeuedItem!.repeats
        seconds = secondsDefault
        
        updateLabel()
    }
    
    @IBAction func startButtonAction(_ sender: Any)
    {
        if isTimerRunning == false
        {
            runTimer()
        }
    }
    
    func runTimer()
    {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(RunTimerViewController.updateTimer)), userInfo: nil, repeats: true)
        
        isTimerRunning = true
    }
    
    @IBAction func pauseButtonAction(_ sender: Any)
    {
        if self.resumeTapped == false
        {
            timer.invalidate()
            self.resumeTapped = true
        }
        else
        {
            runTimer()
            self.resumeTapped = false
        }
    }
    
    @IBAction func resetButtonAction(_ sender: Any)
    {
        timer.invalidate()
        isTimerRunning = false
        seconds = 60
        updateLabel()
    }
    
    @objc func updateTimer()
    {
        if seconds > 1
        {
            seconds -= 1
        }
        else if seconds == 1 && roundsOfSecondsDefault > 0
        {
            seconds = secondsDefault
            roundsOfSecondsDefault -= 1
        }
        else if seconds == 1 && !queuedTimes.isEmpty()
        {
            let dequeuedItem = queuedTimes.dequeue()
            secondsDefault = dequeuedItem!.seconds
            roundsOfSecondsDefault = dequeuedItem!.repeats
            seconds = secondsDefault
        }
        else if seconds == 1
        {
            seconds -= 1
        }
        else if seconds == 0
        {
            timer.invalidate()
        }
        
        updateLabel()
    }
    
    func updateLabel()
    {
        timeLabel.text = timeString(time: TimeInterval(seconds))
    }
    
    func timeString(time:TimeInterval) -> String
    {
        let hours = Int(time) / 3600
        let minutes = (Int(time) / 60) % 60
        let seconds = Int(time) % 60
        
        if (hours == 0 && minutes == 0)
        {
            return "\(seconds)"
        }
        else if (hours == 0)
        {
            return String(format: "%d:%02d", minutes, seconds)
        }
        else
        {
            return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
        }
    }
}
