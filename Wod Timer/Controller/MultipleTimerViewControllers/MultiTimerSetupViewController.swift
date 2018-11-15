//
//  MultiTimerSetupViewController.swift
//  Wod Timer
//
//  Created by Bryan Matzko on 2018-11-08.
//  Copyright © 2018 Bryan Matzko. All rights reserved.
//

import UIKit

class MultiTimerSetupViewController: UIViewController
{
    @IBOutlet weak var timer1Selector: UIButton!
    @IBOutlet weak var timer2Selector: UIButton!
    @IBOutlet weak var timer3Selector: UIButton!
    @IBOutlet weak var timer4Selector: UIButton!
    @IBOutlet weak var timer5Selector: UIButton!
    
    var timerTypesToCombine = [TimersEnum.none, TimersEnum.none, TimersEnum.none, TimersEnum.none, TimersEnum.none]
    
    var lastHitUIButton = UIButton()
    var lastHitUIButtonInt = 0;
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        timer2Selector.isEnabled = false
        timer3Selector.isEnabled = false
        timer4Selector.isEnabled = false
        timer5Selector.isEnabled = false
        
        NotificationCenter.default.addObserver(self, selector: #selector(handlePopupClosing), name: .saveTimerType, object: nil)
    }
    
    @objc func handlePopupClosing(notification: Notification)
    {
        let timerTypePopupData = notification.object as! TimerPopupViewController
        
        lastHitUIButton.setTitle(convertTimersEnumToString(timerEnum: timerTypePopupData.timerType), for: .normal)
        timerTypesToCombine[lastHitUIButtonInt] = timerTypePopupData.timerType
    }
    
    @IBAction func timer1SelectorTap(_ sender: Any)
    {
        lastHitUIButton = timer1Selector
        lastHitUIButtonInt = 0;
        timer2Selector.isEnabled = true
    }
    
    @IBAction func timer2SelectorTap(_ sender: Any)
    {
        lastHitUIButton = timer2Selector
        lastHitUIButtonInt = 1;
        timer3Selector.isEnabled = true
    }
    
    @IBAction func timer3SelectorTap(_ sender: Any)
    {
        lastHitUIButton = timer3Selector
        lastHitUIButtonInt = 2;
        timer4Selector.isEnabled = true
    }
    
    @IBAction func timer4SelectorTap(_ sender: Any)
    {
        lastHitUIButton = timer4Selector
        lastHitUIButtonInt = 3;
        timer5Selector.isEnabled = true
    }
    
    @IBAction func timer5SelectorTap(_ sender: Any)
    {
        lastHitUIButton = timer5Selector
        lastHitUIButtonInt = 4;
    }
    
    /*
     let nextScreen = sb.instantiateViewController(withIdentifier: "MultiTimerEmomViewController")
     let nextScreen = sb.instantiateViewController(withIdentifier: "MultiTimerTabataViewController")
     */
    @IBAction func ContinueMultiTimerSetupButton(_ sender: UIButton)
    {
        timerTypesToCombine = timerTypesToCombine.filter { $0 != TimersEnum.none }
        
        //If user hasn't entered any timers yet don't continue!
        if timerTypesToCombine.count == 0
        {
            return
        }
        
        let sb = UIStoryboard(name: "MultiTimerSelector", bundle: nil)
        
        if (timerTypesToCombine[0] == TimersEnum.amrap || timerTypesToCombine[0] == TimersEnum.forTime)
        {
            let nextScreen = sb.instantiateViewController(withIdentifier: "MultiTimerAmrapFTViewController") as! MultiTimerAmrapViewController
            
            //Provide values to screen
            nextScreen.timerID = timerTypesToCombine[0]
            timerTypesToCombine.removeFirst()
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
