//
//  SettingViewController.swift
//  Utility Converter
//
//  Created by Chaveen Ellawela on 2021-02-14.
//

import Foundation
import UIKit

class SettingViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var roundUpDecimalNumberSegementController: UISegmentedControl!
    @IBOutlet weak var roundUpDecimalTextField: UITextField!
    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var settingDescription: UITextView!
    @IBOutlet weak var customKeyboard: CustomKeyboard!
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.assignDelegates()
        setupUI()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        customKeyboard.activeTextField = textField
    }
    func assignDelegates() {
        roundUpDecimalTextField.delegate = self
    }
    
    private func setupUI(){
        roundUpDecimalTextField.layer.borderWidth = 1
        roundUpDecimalTextField.layer.borderColor = UIColor.darkGray.cgColor
        roundUpDecimalTextField.layer.cornerRadius = 10
        settingDescription.text = NSLocalizedString("SettingDescription", comment: "")
        
        if(defaults.integer(forKey: StoreKeys.DECIMAL_VALUE_KEY) < 5) {
            roundUpDecimalNumberSegementController.selectedSegmentIndex = defaults.integer(forKey: StoreKeys.DECIMAL_VALUE_KEY) - 2
            roundUpDecimalTextField.isHidden = true
            saveBtn.isHidden = true
            customKeyboard.isHidden = true
        } else {
            roundUpDecimalNumberSegementController.selectedSegmentIndex = 3
            roundUpDecimalTextField.text = String(defaults.integer(forKey: StoreKeys.DECIMAL_VALUE_KEY))
            roundUpDecimalTextField.isHidden = false
            saveBtn.isHidden = false
            customKeyboard.isHidden = false
        }
        
    }
    
    @IBAction func segementControllerValueChanged(_ sender: UISegmentedControl) {
        
        if(roundUpDecimalNumberSegementController.selectedSegmentIndex == 0)
        {
            setupDecimalRoundupNumber(index: roundUpDecimalNumberSegementController.selectedSegmentIndex,value: 2)
            
        }
        else if(roundUpDecimalNumberSegementController.selectedSegmentIndex == 1)
        {
            setupDecimalRoundupNumber(index: roundUpDecimalNumberSegementController.selectedSegmentIndex,value: 3)
        }else if (roundUpDecimalNumberSegementController.selectedSegmentIndex == 2)
        {
            setupDecimalRoundupNumber(index: roundUpDecimalNumberSegementController.selectedSegmentIndex,value: 4)
        } else{
            roundUpDecimalNumberSegementController.selectedSegmentIndex = 4
            roundUpDecimalTextField.isHidden = false
            saveBtn.isHidden = false
            customKeyboard.isHidden = false
            roundUpDecimalTextField.text = String(defaults.integer(forKey: StoreKeys.DECIMAL_VALUE_KEY))
        }
    }
    
    private func setupDecimalRoundupNumber(index:Int, value:Int) {
        defaults.set(value, forKey: StoreKeys.DECIMAL_VALUE_KEY)
        roundUpDecimalNumberSegementController.selectedSegmentIndex = index
        roundUpDecimalTextField.isHidden = true
        saveBtn.isHidden = true
        customKeyboard.isHidden = true
    }
    
    @IBAction func saveBtnPressed(_ sender: UIButton) {
        if let number = Int(roundUpDecimalTextField.text!) {
            if (number < Constants.MAX_DECIMAL_ROUND_UP_NUMBER) {
                defaults.set(number, forKey: StoreKeys.DECIMAL_VALUE_KEY)
                dismiss(animated: true, completion: nil)
            } else {
                displayAlertView(alertTitle: Alerts.InvalidDecimalRoundUpNumber.TITLE, alertDescription: Alerts.InvalidDecimalRoundUpNumber.MESSAGE)
            }
            
        }else{
            displayAlertView(alertTitle: Alerts.InvalidDecimalRoundUpNumber.TITLE, alertDescription: Alerts.InvalidDecimalRoundUpNumber.MESSAGE)
        }
    }
    
    
}
