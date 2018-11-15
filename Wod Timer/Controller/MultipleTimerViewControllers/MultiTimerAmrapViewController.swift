//
//  MultiTimerAmrapViewController.swift
//  Wod Timer
//
//  Created by Bryan Matzko on 2018-11-08.
//  Copyright © 2018 Bryan Matzko. All rights reserved.
//

import UIKit

class MultiTimerAmrapViewController: UIViewController
{
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var durationValueButton: UIButton!
    
    //Generic Timer To Setup
    var selectedTimer = timerType(title: String(), instructions: String(), timer: TimersEnum.none)
    var timerTypesToCombine = [TimersEnum]()
    var timerID = TimersEnum.none
    
    var _queuedTimes = Queue<SecondsRepeatsPair>()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        titleLabel.text = convertTimersEnumToString(timerEnum: timerID)
        
        selectedTimer = timerType(title: String(), instructions: String(), timer: timerID)
        
        NotificationCenter.default.addObserver(self, selector: #selector(handlePopupClosing), name: .saveDurationPicker, object: nil)
    }
    
    @objc func handlePopupClosing(notification: Notification)
    {
        let timerTypePopupData = notification.object as! timerType
        
        selectedTimer = timerTypePopupData
        
        
        durationValueButton.setTitle(durationToString(min: selectedTimer.durationWorkMinutes, sec: selectedTimer.durationWorkSeconds), for: .normal)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let timerSetupVC: DurationPickerPopupViewController = segue.destination as! DurationPickerPopupViewController
        timerSetupVC.selectedTimer = selectedTimer
    }
    
    @IBAction func nextScreenButtonClick(_ sender: Any)
    {
        _queuedTimes.enqueue(other: createQueue(timerInfo: selectedTimer))
        
        //If user hasn't entered any timers yet don't continue!
        if timerTypesToCombine.count == 0
        {
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let nextScreen = sb.instantiateViewController(withIdentifier: "RunTimerVC") as! RunTimerViewController
            
            nextScreen._queuedTimes = _queuedTimes
            
            self.present(nextScreen, animated: true)
            return
        }
        
        let sb = UIStoryboard(name: "MultiTimerSelector", bundle: nil)
        
        if (timerTypesToCombine[0] == TimersEnum.amrap || timerTypesToCombine[0] == TimersEnum.forTime)
        {
            let nextScreen = sb.instantiateViewController(withIdentifier: "MultiTimerAmrapFTViewController") as! MultiTimerAmrapViewController
            
            //Provide values to screen
            nextScreen.timerID = timerTypesToCombine[0]
            timerTypesToCombine.removeFirst()
            nextScreen._queuedTimes = _queuedTimes
            nextScreen.timerTypesToCombine = timerTypesToCombine
            
            //present the new screen
            self.present(nextScreen, animated: true)
        }
        else if (timerTypesToCombine[0] == TimersEnum.emom)
        {
            //self.present(nextScreen, animated: true)
        }
        else if (timerTypesToCombine[0] == TimersEnum.tabata)
        {
            //self.present(nextScreen, animated: true)
        }
    }
    
    
}
