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
    @IBOutlet weak var playPauseButton: UIButton!
    
    var _seconds: Int = 60
    var _timer = Timer()
    var _isTimerRunning = false
    
    var _secondsDefault = Int()
    var _roundsOfSecondsDefault = Int()
    
    var _timerType = TimersEnum.none
    var _queuedTimes = Queue<SecondsRepeatsPair>()
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //_queuedTimes.enqueue(SecondsRepeatPair(secondsValue: 5, repeatsValue: 0))
        //_queuedTimes.enqueue(SecondsRepeatPair(secondsValue: 10, repeatsValue: 0))
        //_queuedTimes.enqueue(SecondsRepeatPair(secondsValue: 4, repeatsValue: 2))
        
        //Set current value of our timer
        let dequeuedItem = _queuedTimes.dequeue()
        _secondsDefault = dequeuedItem!.seconds
        _roundsOfSecondsDefault = dequeuedItem!.repeats
        _seconds = _secondsDefault
        
        updateLabel()
    }
    
    @IBAction func startButtonAction(_ sender: Any)
    {
        if _isTimerRunning == false
        {
            runTimer()
            playPauseButton.setTitle("Pause", for: UIControl.State.normal)
        }
        else
        {
            _timer.invalidate()
            _isTimerRunning = false
            playPauseButton.setTitle("Play", for: UIControl.State.normal)
        }
    }
    
    func runTimer()
    {
        _timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(RunTimerViewController.updateTimer)), userInfo: nil, repeats: true)
        
        _isTimerRunning = true
    }
    
    @objc func updateTimer()
    {
        if _seconds > 1
        {
            _seconds -= 1
        }
        else if _seconds == 1 && _roundsOfSecondsDefault > 0
        {
            _seconds = _secondsDefault
            _roundsOfSecondsDefault -= 1
        }
        else if _seconds == 1 && !_queuedTimes.isEmpty()
        {
            let dequeuedItem = _queuedTimes.dequeue()
            _secondsDefault = dequeuedItem!.seconds
            _roundsOfSecondsDefault = dequeuedItem!.repeats
            _seconds = _secondsDefault
        }
        else if _seconds == 1
        {
            _seconds -= 1
        }
        else if _seconds == 0
        {
            _timer.invalidate()
        }
        
        updateLabel()
    }
    
    func updateLabel()
    {
        timeLabel.text = timeString(time: TimeInterval(_seconds))
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
