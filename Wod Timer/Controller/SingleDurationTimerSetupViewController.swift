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
    var selectedTimer = timerType(title: String(), instructions: String(), timer: TimersEnum.None)
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        startButton.frame = CGRect(x: startButton.frame.origin.x, y: startButton.frame.origin.y, width: startButton.frame.width, height: self.view.frame.height/8)
        
        singleTimerDurationTextField.layer.cornerRadius = singleTimerDurationTextField.frame.size.height/2
        singleTimerDurationTextField.layer.borderWidth = 1
        singleTimerDurationTextField.layer.borderColor = colours.pink.cgColor
        
        setupSingleTimerInformation()
    }
    
    func setupSingleTimerInformation()
    {
        timerTitleLabel.text = selectedTimer.Title
        timerInstructionLabel.text = selectedTimer.Instructions
        
        createDurationPicker()
        
        selectedTimer.durationMinutes = 10
        selectedTimer.durationSeconds = 0
        selectedTimer.totalDurationSeconds = selectedTimer.durationMinutes * 60
        
        singleTimerDurationTextField.text = "10 Minutes"
        singleTimerDurationTextField.inputView = durationPicker
        
        createToolbar()
    }
    
    func createDurationPicker()
    {
        durationPicker.delegate = self
        durationPicker.selectRow(10, inComponent: 0, animated: false)
        
        durationPicker.backgroundColor = .black
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
    
    @IBAction func helpButton(_ sender: Any)
    {
        //Tool tip to give directions
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let runTimerVC: RunTimerViewController = segue.destination as! RunTimerViewController
        runTimerVC.selectedTimer = selectedTimer
        
        let backItem = UIBarButtonItem()
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem
    }
}
