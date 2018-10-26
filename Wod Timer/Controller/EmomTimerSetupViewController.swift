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
    @IBOutlet weak var intervalDurationTextBox: UITextField!
    @IBOutlet weak var durationTextBox: UITextField!
    @IBOutlet weak var helpButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    
    //Timer setup pickers
    let durationPicker = UIPickerView()
    let roundsPicker = UIPickerView()
    
    //Generic Timer To Setup
    var selectedTimer = timerType(title: String(), instructions: String(), timer: TimersEnum.None)
    
    @IBOutlet weak var intervalDurationTextField: UITextField!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        startButton.frame = CGRect(x: startButton.frame.origin.x, y: startButton.frame.origin.y, width: startButton.frame.width, height: self.view.frame.height/8)
        
        intervalDurationTextBox.layer.cornerRadius = intervalDurationTextBox.frame.size.height/2
        intervalDurationTextBox.layer.borderWidth = 1
        intervalDurationTextBox.layer.borderColor = colours.pink.cgColor
        
        durationTextBox.layer.cornerRadius = durationTextBox.frame.size.height/2
        durationTextBox.layer.borderWidth = 1
        durationTextBox.layer.borderColor = colours.pink.cgColor
        
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
        selectedTimer.durationMinutes = 10
        selectedTimer.durationSeconds = 0
        selectedTimer.totalDurationSeconds = selectedTimer.durationSeconds * 60
        
        //Text Box Defaults
        intervalDurationTextBox.text = "1 min"
        intervalDurationTextBox.inputView = durationPicker
        durationTextBox.text = "10 min"
        durationTextBox.inputView = roundsPicker
        
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
        
        intervalDurationTextBox.inputAccessoryView = toolbar
        durationTextBox.inputAccessoryView = toolbar
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
