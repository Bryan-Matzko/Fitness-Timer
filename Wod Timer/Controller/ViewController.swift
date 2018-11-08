//
//  ViewController.swift
//  Wod Timer
//
//  Created by Bryan Matzko on 2018-09-30.
//  Copyright © 2018 Bryan Matzko. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var forTimeButton: UIButton!
    @IBOutlet weak var amrapButton: UIButton!
    @IBOutlet weak var emomButton: UIButton!
    @IBOutlet weak var tabataButton: UIButton!
    @IBOutlet weak var CombineTimerButton: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //Create background colour, round edges
        amrapButton.createButtonGradient(startColour: colours.white, endColour: colours.blue)
        forTimeButton.createButtonGradient(startColour: colours.white, endColour: colours.blue)
        emomButton.createButtonGradient(startColour: colours.white, endColour: colours.blue)
        tabataButton.createButtonGradient(startColour: colours.white, endColour: colours.blue)
        CombineTimerButton.createButtonGradient(startColour: colours.white, endColour: colours.blue)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let senderTag = (sender as! UIButton).tag
        if senderTag == 0 || senderTag == 1
        {
            let timerSetupVC: SingleDurationTimerSetupViewController = segue.destination as! SingleDurationTimerSetupViewController
            timerSetupVC.selectedTimer = timerTypes[senderTag]
        }
        else if senderTag == 2
        {
            let timerSetupVC: EmomTimerSetupViewController = segue.destination as! EmomTimerSetupViewController
            timerSetupVC.selectedTimer = timerTypes[senderTag]
        }
        else if senderTag == 3
        {
            let timerSetupVC: TabataTimerSetupViewController = segue.destination as! TabataTimerSetupViewController
            timerSetupVC.selectedTimer = timerTypes[senderTag]
        }
        
        let backItem = UIBarButtonItem()
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem // This will show in the next view controller being pushed
    }
    
}
