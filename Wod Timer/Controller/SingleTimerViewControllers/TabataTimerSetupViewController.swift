//
//  TabataTimerSetupViewController.swift
//  Wod Timer
//
//  Created by Bryan Matzko on 2018-09-30.
//  Copyright © 2018 Bryan Matzko. All rights reserved.
//

import UIKit

class TabataTimerSetupViewController: UIViewController
{
    //Buttons and Labels
    @IBOutlet weak var timerTitleLabel: UILabel!
    @IBOutlet weak var timerInstructionLabel: UILabel!
    
    @IBOutlet weak var workDurationTextField: UITextField!
    @IBOutlet weak var restDurationTextField: UITextField!
    @IBOutlet weak var roundsTextField: UITextField!
    
    @IBOutlet weak var startButton: UIButton!
    
    //Timer setup pickers
    let durationPicker = UIPickerView()
    let restDurationPicker = UIPickerView()
    let roundsPicker = UIPickerView()
    var totalDurationSeconds = Int()
    
    //Generic Timer To Setup
    var selectedTimer = timerType(title: String(), instructions: String(), timer: TimersEnum.none)
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        startButton.styleStartButton(frameHeight: self.view.frame.height)
        
        workDurationTextField.styleTextFields()
        restDurationTextField.styleTextFields()
        roundsTextField.styleTextFields()
        
        setupTabataInformation()
    }
    
    func setupTabataInformation()
    {
        //Populate General Information
        timerTitleLabel.text = selectedTimer.Title
        timerInstructionLabel.text = selectedTimer.Instructions
        
        //Create Pickers
        createDurationPicker()
        createRestDurationPicker()
        createRoundsPicker()
        
        //Set up timer defaults
        selectedTimer.rounds = 10
        selectedTimer.durationRestMinutes = 1
        selectedTimer.durationRestSeconds = 0
        selectedTimer.durationWorkMinutes = 1
        selectedTimer.durationWorkSeconds = 0
        totalDurationSeconds = ((selectedTimer.durationWorkMinutes + selectedTimer.durationRestMinutes) * selectedTimer.rounds - selectedTimer.durationRestMinutes) * 60
        
        //Text Box Defaults
        workDurationTextField.text = "1 min"
        workDurationTextField.inputView = durationPicker
        restDurationTextField.text = "1 min"
        restDurationTextField.inputView = restDurationPicker
        roundsTextField.text = "10 rounds"
        roundsTextField.inputView = roundsPicker
        
        createToolbar()
        
    }
    
    func createDurationPicker()
    {
        durationPicker.delegate = self
        durationPicker.selectRow(1, inComponent: 0, animated: false)
        
        durationPicker.backgroundColor = .black
    }
    
    func createRestDurationPicker()
    {
        restDurationPicker.delegate = self
        restDurationPicker.selectRow(1, inComponent: 0, animated: false)
        
        restDurationPicker.backgroundColor = .black
        
    }
    
    func createRoundsPicker()
    {
        roundsPicker.delegate = self
        roundsPicker.selectRow(9, inComponent: 0, animated: false)
        
        roundsPicker.backgroundColor = .black
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
        
        workDurationTextField.inputAccessoryView = toolbar
        restDurationTextField.inputAccessoryView = toolbar
        roundsTextField.inputAccessoryView = toolbar
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
        
        runTimerVC._timerType = selectedTimer.TimerId
        runTimerVC._queuedTimes = createQueue(timerInfo: selectedTimer)
        
        let backItem = UIBarButtonItem()
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem
    }
}
