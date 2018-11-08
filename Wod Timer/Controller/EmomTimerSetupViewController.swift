//
//  EmomTimerSetupViewController.swift
//  Wod Timer
//
//  Created by Bryan Matzko on 2018-09-30.
//  Copyright © 2018 Bryan Matzko. All rights reserved.
//

import UIKit

class EmomTimerSetupViewController: UIViewController
{
    //UI Elements
    @IBOutlet weak var timerTitleLabel: UILabel!
    @IBOutlet weak var timerInstructionLabel: UILabel!
    
    @IBOutlet weak var intervalDurationTextField: UITextField!
    @IBOutlet weak var durationTextField: UITextField!
    
    @IBOutlet weak var startButton: UIButton!
    
    //Timer setup pickers
    let durationPicker = UIPickerView()
    let roundsPicker = UIPickerView()
    
    //Generic Timer To Setup
    var selectedTimer = timerType(title: String(), instructions: String(), timer: TimersEnum.none)
    var totalDurationSeconds = Int()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        startButton.styleStartButton(frameHeight: self.view.frame.height)
        
        intervalDurationTextField.styleTextFields()
        durationTextField.styleTextFields()
        
        setupEmomTimer()
    }
    
    func setupEmomTimer()
    {
        //Populate General Information
        timerTitleLabel.text = selectedTimer.Title
        timerInstructionLabel.text = selectedTimer.Instructions
        
        //Create Pickers
        createDurationPicker()
        createRoundsPicker()
        
        //Set up timer defaults
        selectedTimer.durationWorkMinutes = 10
        selectedTimer.durationWorkSeconds = 0
        totalDurationSeconds = selectedTimer.durationWorkSeconds * 60
        
        //Text Box Defaults
        intervalDurationTextField.text = "1 min"
        intervalDurationTextField.inputView = durationPicker
        durationTextField.text = "10 min"
        durationTextField.inputView = roundsPicker
        
        createToolbar()
    }
    
    func createDurationPicker()
    {
        durationPicker.delegate = self
        durationPicker.selectRow(10, inComponent: 0, animated: false)
        
        durationPicker.backgroundColor = .black
    }
    
    func createRoundsPicker()
    {
        roundsPicker.delegate = self
        roundsPicker.selectRow(10, inComponent: 0, animated: false)
        
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
        
        intervalDurationTextField.inputAccessoryView = toolbar
        durationTextField.inputAccessoryView = toolbar
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
