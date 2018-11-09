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
    
    var lastHitUIButton = UIButton()
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
    }
    
    /*
     let nextScreen = sb.instantiateViewController(withIdentifier: "MultiTimerEmomViewController")
     let nextScreen = sb.instantiateViewController(withIdentifier: "MultiTimerTabataViewController")
     */
    @IBAction func ContinueMultiTimerSetupButton(_ sender: UIButton)
    {
        let sb = UIStoryboard(name: "MultiTimerSelector", bundle: nil)
        let nextScreen = sb.instantiateViewController(withIdentifier: "MultiTimerAmrapFTViewController")
        
        self.present(nextScreen, animated: true)
    }
    
    @IBAction func timer1SelectorTap(_ sender: Any)
    {
        lastHitUIButton = timer1Selector
        timer2Selector.isEnabled = true
    }
    
    @IBAction func timer2SelectorTap(_ sender: Any)
    {
        lastHitUIButton = timer2Selector
        timer3Selector.isEnabled = true
    }
    
    @IBAction func timer3SelectorTap(_ sender: Any)
    {
        lastHitUIButton = timer3Selector
        timer4Selector.isEnabled = true
    }
    
    @IBAction func timer4SelectorTap(_ sender: Any)
    {
        lastHitUIButton = timer4Selector
        timer5Selector.isEnabled = true
    }
    
    @IBAction func timer5SelectorTap(_ sender: Any)
    {
        lastHitUIButton = timer5Selector
    }
}
