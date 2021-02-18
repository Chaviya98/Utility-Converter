//
//  SpeedViewController.swift
//  Utility Converter
//
//  Created by Chaveen Ellawela on 2021-02-14.
//

import Foundation
import UIKit


enum SpeedUnits: Int {
    case metrespersec, kmperhour, milesperhour, knotsperhour
}


class SpeedViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var textFieldMetresPerSec: UITextField!
    @IBOutlet weak var textFieldKmPerHour: UITextField!
    @IBOutlet weak var textFieldMilesPerHour: UITextField!
    @IBOutlet weak var textFieldKnotsPerHour: UITextField!
    @IBOutlet weak var customKeyboard: CustomKeyboard!
    
    var speed : Speed = Speed(metresPerSec: 0.0, kmPerHour: 0.0, milesPerHour: 0.0, knotsPerHour: 0.0)
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        self.assignDelegates()
        resetTextFieldsToDefaultSate()
        disableDefaultKeyboard()
        retrievingDataInAppOpen()
    }
    
    private func setupUI(){
        textFieldMetresPerSec.layer.borderWidth = 1
        textFieldMetresPerSec.layer.borderColor = UIColor.darkGray.cgColor
        textFieldMetresPerSec.layer.cornerRadius = 10
        
        textFieldKmPerHour.layer.borderWidth = 1
        textFieldKmPerHour.layer.borderColor = UIColor.darkGray.cgColor
        textFieldKmPerHour.layer.cornerRadius = 10
        
        textFieldMilesPerHour.layer.borderWidth = 1
        textFieldMilesPerHour.layer.borderColor = UIColor.darkGray.cgColor
        textFieldMilesPerHour.layer.cornerRadius = 10
        
        textFieldKnotsPerHour.layer.borderWidth = 1
        textFieldKnotsPerHour.layer.borderColor = UIColor.darkGray.cgColor
        textFieldKnotsPerHour.layer.cornerRadius = 10
    }
    
    func assignDelegates() {
        textFieldMetresPerSec.delegate = self
        textFieldKmPerHour.delegate = self
        textFieldMilesPerHour.delegate = self
        textFieldKnotsPerHour.delegate = self
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        customKeyboard.activeTextField = textField
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        savingDataInAppClose()
    }
    
    @IBAction func speedViewTextFieldValueChanged(_ sender: UITextField) {
        // validation check for empty text fields
        if (sender.text == ""){
            resetTextFieldsToDefaultSate()
        } else {
            guard let textFieldValue = sender.text else { return displayAlertView(alertTitle: NSLocalizedString("ConvertingFailMsgTitle", comment: ""), alertDescription: NSLocalizedString("ConvertingFailMsgDescriptionForCommonUse", comment: "")) }
            guard let doubleTextFieldValue = Double(textFieldValue) else { return displayAlertView(alertTitle: NSLocalizedString("ConvertingFailMsgTitle", comment: ""), alertDescription: NSLocalizedString("ConvertingFailMsgDescriptionForInvalidInput", comment: "")) }
            
            switch SpeedUnits(rawValue: sender.tag)! {
            
            case .metrespersec:
                let speedUnitObjForMetresPerSec = Measurement(value:doubleTextFieldValue, unit: UnitSpeed.metersPerSecond)
                speed.kmPerHour = speedUnitObjForMetresPerSec.converted(to: .kilometersPerHour).value
                speed.milesPerHour = speedUnitObjForMetresPerSec.converted(to: .milesPerHour).value
                speed.knotsPerHour = speedUnitObjForMetresPerSec.converted(to: .knots).value
                
                textFieldKmPerHour.text = "\(formatTextFieldValue(data: speed.kmPerHour))"
                textFieldMilesPerHour.text = "\(formatTextFieldValue(data: speed.milesPerHour))"
                textFieldKnotsPerHour.text = "\(formatTextFieldValue(data: speed.knotsPerHour))"
            case .kmperhour:
                let speedUnitObjForKilometersPerHour = Measurement(value:doubleTextFieldValue, unit: UnitSpeed.kilometersPerHour)
                speed.metresPerSec = speedUnitObjForKilometersPerHour.converted(to: .metersPerSecond).value
                speed.milesPerHour = speedUnitObjForKilometersPerHour.converted(to: .milesPerHour).value
                speed.knotsPerHour = speedUnitObjForKilometersPerHour.converted(to: .knots).value
                
                textFieldMetresPerSec.text = "\(formatTextFieldValue(data: speed.milesPerHour))"
                textFieldMilesPerHour.text = "\(formatTextFieldValue(data: speed.milesPerHour))"
                textFieldKnotsPerHour.text = "\(formatTextFieldValue(data: speed.knotsPerHour))"
            case .milesperhour:
                let speedUnitObjForMilesPerHour = Measurement(value:doubleTextFieldValue, unit: UnitSpeed.milesPerHour)
                speed.metresPerSec = speedUnitObjForMilesPerHour.converted(to: .metersPerSecond).value
                speed.kmPerHour = speedUnitObjForMilesPerHour.converted(to: .kilometersPerHour).value
                speed.knotsPerHour = speedUnitObjForMilesPerHour.converted(to: .knots).value
                
                textFieldMetresPerSec.text = "\(formatTextFieldValue(data: speed.milesPerHour))"
                textFieldKmPerHour.text = "\(formatTextFieldValue(data: speed.kmPerHour))"
                textFieldKnotsPerHour.text = "\(formatTextFieldValue(data: speed.knotsPerHour))"
            case .knotsperhour:
                let speedUnitObjForKnots = Measurement(value:doubleTextFieldValue, unit: UnitSpeed.knots)
                speed.metresPerSec = speedUnitObjForKnots.converted(to: .metersPerSecond).value
                speed.kmPerHour = speedUnitObjForKnots.converted(to: .kilometersPerHour).value
                speed.milesPerHour = speedUnitObjForKnots.converted(to: .milesPerHour).value
                
                textFieldMetresPerSec.text = "\(formatTextFieldValue(data: speed.milesPerHour))"
                textFieldKmPerHour.text = "\(formatTextFieldValue(data: speed.kmPerHour))"
                textFieldMilesPerHour.text = "\(formatTextFieldValue(data: speed.milesPerHour))"
            }
        }
    }
    
    @IBAction func saveBtnPressed(_ sender: UIBarButtonItem) {
        
        if(validationCheckForValues()){
            DataManagementStore.saveDataToStore(key: "speed", value: creatingHistoryData())
            displayAlertView(alertTitle: NSLocalizedString("SuccssfullAlertMsgTitle", comment: ""), alertDescription: "")
        } else {
            displayAlertView(alertTitle: NSLocalizedString("FailAlertMsgTitle", comment: ""), alertDescription: NSLocalizedString("FailAlertMsgDescription", comment: ""))
        }
    }
    
    
    @IBAction func historyBtnPressed(_ sender: UIBarButtonItem) {
        let storage = DataManagementStore.getSavedDataFromStore(key: "speed")
        if(storage.count > 0){
            // laoding history page with related history data
            let destination = storyboard?.instantiateViewController(withIdentifier: "historyView") as! HistoryViewController
            destination.storage = storage
            destination.storageType = "speed"
            self.present(destination, animated: true, completion: nil)
        }else{
            displayAlertView(alertTitle: NSLocalizedString("NoHistoryAlertMsgTitle", comment: ""), alertDescription: NSLocalizedString("NoHistoryAlertMsgDescription", comment: ""))
        }
    }
    
    
    // cheking whether all the fields are filled with data
    func validationCheckForValues() -> Bool {
        if(textFieldMetresPerSec.text != "" && textFieldKmPerHour.text != "" && textFieldMilesPerHour.text != "" && textFieldKnotsPerHour.text != "" ){
            return true
        } else{
            return false
        }
    }
    // creating histroy data
    func creatingHistoryData() -> String{
        return "MetersPerSecond --> \(formatTextFieldValue(data: speed.milesPerHour))\n" +
            "KilometersPerHour --> \(formatTextFieldValue(data: speed.kmPerHour))\n" +
            "MilesPerHour --> \(formatTextFieldValue(data: speed.milesPerHour))\n" +
            "Knots --> \(formatTextFieldValue(data: speed.knotsPerHour))"
    }
    
    // saving available data in the text fields when app closing
    func savingDataInAppClose(){
        defaults.set(textFieldMetresPerSec.text, forKey: "speed_metrespersec")
        defaults.set(textFieldKmPerHour.text, forKey: "speed_kmperhour")
        defaults.set(textFieldMilesPerHour.text, forKey: "speed_milesperhour")
        defaults.set(textFieldKnotsPerHour.text, forKey: "speed_knotsperhour")
        defaults.synchronize()
    }
    
    //  retrieving saved data for text fields when app opening
    func retrievingDataInAppOpen(){
        textFieldMetresPerSec.text = defaults.string(forKey: "speed_metrespersec")
        textFieldKmPerHour.text = defaults.string(forKey: "speed_kmperhour")
        textFieldMilesPerHour.text = defaults.string(forKey: "speed_milesperhour")
        textFieldKnotsPerHour.text = defaults.string(forKey: "speed_knotsperhour")
    }
    
    // reseting text fields to default sate
    func resetTextFieldsToDefaultSate(){
        textFieldMetresPerSec.text = ""
        textFieldKmPerHour.text = ""
        textFieldMilesPerHour.text = ""
        textFieldKnotsPerHour.text = ""
        
        
        textFieldMetresPerSec.placeholder = "0"
        textFieldKmPerHour.placeholder = "0"
        textFieldMilesPerHour.placeholder = "0"
        textFieldKnotsPerHour.placeholder = "0"
        
    }
    
    
    // disabling the default keyboard
    func disableDefaultKeyboard(){
        textFieldMetresPerSec.inputView = UIView()
        textFieldKmPerHour.inputView = UIView()
        textFieldMilesPerHour.inputView = UIView()
        textFieldKnotsPerHour.inputView = UIView()
    }
    
    // formatting value into 2 decimal points
    func formatTextFieldValue(data : Double) -> String {
        return String(data.roundToDecimal(defaults.integer(forKey: "roundup_decimalnumber")))
    }
}
