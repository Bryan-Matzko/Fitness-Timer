//
//  TimerSetupViewController.swift
//  Wod Timer
//
//  Created by Bryan Matzko on 2018-09-30.
//  Copyright © 2018 Bryan Matzko. All rights reserved.
//

import UIKit

class SingleDurationTimerSetupViewController: UIViewController
{
    //UI Elements
    @IBOutlet weak var timerTitleLabel: UILabel!
    @IBOutlet weak var timerInstructionLabel: UILabel!
    
    @IBOutlet weak var singleTimerDurationTextField: UITextField!
    
    @IBOutlet weak var helpButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    
    //Timer setup pickers
    let durationPicker = UIPickerView()
    
    //Generic Timer To Setup
    var selectedTimer = timerType(title: String(), instructions: String(), timer: TimersEnum.none)
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        startButton.styleStartButton(frameHeight: self.view.frame.height)
        
        singleTimerDurationTextField.styleTextFields()
        
        setupSingleTimerInformation()
    }
    
    func setupSingleTimerInformation()
    {
        createDurationPicker()
        createToolbar()
        updateTextField()
    }
    
    func setupSelectedTimer()
    {
        timerTitleLabel.text = selectedTimer.Title
        timerInstructionLabel.text = selectedTimer.Instructions
        
        selectedTimer.durationWorkMinutes = 10
        selectedTimer.durationWorkSeconds = 0
    }
    
    func createDurationPicker()
    {
        durationPicker.delegate = self
        durationPicker.selectRow(10, inComponent: 0, animated: false)
        durationPicker.backgroundColor = .black
        singleTimerDurationTextField.inputView = durationPicker
    }
    
    func createToolbar()
    {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.plain, target: self, action: #selector(dismissKeyboard))
        
        toolbar.barTintColor = .black
        toolbar.tintColor = .white
        
        toolbar.setItems([doneButton], animated: false)
        toolbar.isUserInteractionEnabled = true
        
        singleTimerDurationTextField.inputAccessoryView = toolbar
    }
    
    @objc func dismissKeyboard()
    {
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let runTimerVC: RunTimerViewController = segue.destination as! RunTimerViewController
        
        runTimerVC._timerType = selectedTimer.TimerId
        runTimerVC._queuedTimes = createQueue(timerInfo: selectedTimer)
        
        let backItem = UIBarButtonItem()
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem
    }
}
