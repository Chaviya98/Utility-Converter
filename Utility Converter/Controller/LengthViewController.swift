//
//  LengthViewController.swift
//  Utility Converter
//
//  Created by Chaveen Ellawela on 2021-02-13.
//

import Foundation
import UIKit

enum LengthUnits: Int {
    case cm, mm, mile, km, metre, yard, inch
}

class LengthViewController: UIViewController, UITextFieldDelegate  {
    
    @IBOutlet weak var textFieldCm: UITextField!
    @IBOutlet weak var textFieldMm: UITextField!
    @IBOutlet weak var textFieldMile: UITextField!
    @IBOutlet weak var textFieldKm: UITextField!
    @IBOutlet weak var textFieldMetre: UITextField!
    @IBOutlet weak var textFieldYard: UITextField!
    @IBOutlet weak var textFieldInch: UITextField!
    @IBOutlet weak var customKeyboard: CustomKeyboard!
    
    var length : Length = Length()
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.assignDelegates()
        resetTextFieldsToDefaultSate()
        disableDefaultKeyboard()
        retrievingDataInAppOpen()
    }
    
    private func setupUI(){
        textFieldCm.layer.borderWidth = 1
        textFieldCm.layer.borderColor = UIColor.darkGray.cgColor
        textFieldCm.layer.cornerRadius = 10
        
        textFieldMm.layer.borderWidth = 1
        textFieldMm.layer.borderColor = UIColor.darkGray.cgColor
        textFieldMm.layer.cornerRadius = 10
        
        textFieldMile.layer.borderWidth = 1
        textFieldMile.layer.borderColor = UIColor.darkGray.cgColor
        textFieldMile.layer.cornerRadius = 10
        
        textFieldKm.layer.borderWidth = 1
        textFieldKm.layer.borderColor = UIColor.darkGray.cgColor
        textFieldKm.layer.cornerRadius = 10
        
        textFieldMetre.layer.borderWidth = 1
        textFieldMetre.layer.borderColor = UIColor.darkGray.cgColor
        textFieldMetre.layer.cornerRadius = 10
        
        textFieldYard.layer.borderWidth = 1
        textFieldYard.layer.borderColor = UIColor.darkGray.cgColor
        textFieldYard.layer.cornerRadius = 10
        
        textFieldInch.layer.borderWidth = 1
        textFieldInch.layer.borderColor = UIColor.darkGray.cgColor
        textFieldInch.layer.cornerRadius = 10
    }
    
    func assignDelegates() {
        textFieldMetre.delegate = self
        textFieldKm.delegate = self
        textFieldMile.delegate = self
        textFieldCm.delegate = self
        textFieldMm.delegate = self
        textFieldYard.delegate = self
        textFieldInch.delegate = self
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        customKeyboard.activeTextField = textField
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        savingDataInAppClose()
    }
    
    @IBAction func lengthViewTextFieldValueChanged(_ sender: UITextField) {
        
        // validation check for empty text fields
        if (sender.text == Constants.DEFAULT_TEXT_FIELD_VALUE){
            resetTextFieldsToDefaultSate()
        } else {
            guard let textFieldValue = sender.text else { return displayAlertView(alertTitle: Alerts.CommonAlert.TITLE, alertDescription: Alerts.CommonAlert.MESSAGE) }
            guard let doubleTextFieldValue = Double(textFieldValue) else { return displayAlertView(alertTitle: Alerts.InvalidParameters.TITLE, alertDescription: Alerts.InvalidParameters.MESSAGE)}
            
            switch LengthUnits(rawValue: sender.tag)! {
            
            case .cm:
                let lengthUnitObjForCentimeter = Measurement(value:doubleTextFieldValue, unit: UnitLength.centimeters)
                length.cm = lengthUnitObjForCentimeter.value
                length.km = lengthUnitObjForCentimeter.converted(to: .kilometers).value
                length.metre = lengthUnitObjForCentimeter.converted(to: .meters).value
                length.mile = lengthUnitObjForCentimeter.converted(to: .miles).value
                length.mm = lengthUnitObjForCentimeter.converted(to: .millimeters).value
                length.yard = lengthUnitObjForCentimeter.converted(to: .yards).value
                length.inch = lengthUnitObjForCentimeter.converted(to: .inches).value
                
                textFieldMetre.text = "\(formatTextFieldValue(data: length.metre))"
                textFieldMile.text = "\(formatTextFieldValue(data: length.mile))"
                textFieldKm.text = "\(formatTextFieldValue(data: length.km))"
                textFieldMm.text = "\(formatTextFieldValue(data: length.mm))"
                textFieldYard.text = "\(formatTextFieldValue(data: length.yard))"
                textFieldInch.text = "\(formatTextFieldValue(data: length.inch))"
            case .mm:
                let lengthUnitObjForMillimeter = Measurement(value:doubleTextFieldValue, unit: UnitLength.millimeters)
                length.mm = lengthUnitObjForMillimeter.value
                length.km = lengthUnitObjForMillimeter.converted(to: .kilometers).value
                length.metre = lengthUnitObjForMillimeter.converted(to: .meters).value
                length.mile = lengthUnitObjForMillimeter.converted(to: .miles).value
                length.cm = lengthUnitObjForMillimeter.converted(to: .centimeters).value
                length.yard = lengthUnitObjForMillimeter.converted(to: .yards).value
                length.inch = lengthUnitObjForMillimeter.converted(to: .inches).value
                
                textFieldMetre.text = "\(formatTextFieldValue(data: length.metre))"
                textFieldKm.text = "\(formatTextFieldValue(data: length.km))"
                textFieldMile.text = "\(formatTextFieldValue(data: length.mile))"
                textFieldCm.text = "\(formatTextFieldValue(data: length.cm))"
                textFieldYard.text = "\(formatTextFieldValue(data: length.yard))"
                textFieldInch.text = "\(formatTextFieldValue(data: length.inch))"
            case .mile:
                let lengthUnitObjForMile = Measurement(value:doubleTextFieldValue, unit: UnitLength.miles)
                length.mile = lengthUnitObjForMile.value
                length.metre = lengthUnitObjForMile.converted(to: .meters).value
                length.km = lengthUnitObjForMile.converted(to: .kilometers).value
                length.cm = lengthUnitObjForMile.converted(to: .centimeters).value
                length.mm = lengthUnitObjForMile.converted(to: .millimeters).value
                length.yard = lengthUnitObjForMile.converted(to: .yards).value
                length.inch = lengthUnitObjForMile.converted(to: .inches).value
                
                textFieldMetre.text = "\(formatTextFieldValue(data: length.metre))"
                textFieldKm.text = "\(formatTextFieldValue(data: length.km))"
                textFieldCm.text = "\(formatTextFieldValue(data: length.cm))"
                textFieldMm.text = "\(formatTextFieldValue(data: length.mm))"
                textFieldYard.text = "\(formatTextFieldValue(data: length.yard))"
                textFieldInch.text = "\(formatTextFieldValue(data: length.inch))"
            case .km:
                let lengthUnitObjForKilometer = Measurement(value:doubleTextFieldValue, unit: UnitLength.kilometers)
                length.km = lengthUnitObjForKilometer.value
                length.metre = lengthUnitObjForKilometer.converted(to: .meters).value
                length.mile = lengthUnitObjForKilometer.converted(to: .miles).value
                length.cm = lengthUnitObjForKilometer.converted(to: .centimeters).value
                length.mm = lengthUnitObjForKilometer.converted(to: .millimeters).value
                length.yard = lengthUnitObjForKilometer.converted(to: .yards).value
                length.inch = lengthUnitObjForKilometer.converted(to: .inches).value
                
                textFieldMetre.text = "\(formatTextFieldValue(data: length.metre))"
                textFieldMile.text = "\(formatTextFieldValue(data: length.mile))"
                textFieldCm.text = "\(formatTextFieldValue(data: length.cm))"
                textFieldMm.text = "\(formatTextFieldValue(data: length.mm))"
                textFieldYard.text = "\(formatTextFieldValue(data: length.yard))"
                textFieldInch.text = "\(formatTextFieldValue(data: length.inch))"
            case .metre:
                let lengthUnitObjForMetre = Measurement(value:doubleTextFieldValue, unit: UnitLength.meters)
                length.metre = lengthUnitObjForMetre.value
                length.km = lengthUnitObjForMetre.converted(to: .kilometers).value
                length.mile = lengthUnitObjForMetre.converted(to: .miles).value
                length.cm = lengthUnitObjForMetre.converted(to: .centimeters).value
                length.mm = lengthUnitObjForMetre.converted(to: .millimeters).value
                length.yard = lengthUnitObjForMetre.converted(to: .yards).value
                length.inch = lengthUnitObjForMetre.converted(to: .inches).value
                
                textFieldKm.text = "\(formatTextFieldValue(data: length.km))"
                textFieldMile.text = "\(formatTextFieldValue(data: length.mile))"
                textFieldCm.text = "\(formatTextFieldValue(data: length.cm))"
                textFieldMm.text = "\(formatTextFieldValue(data: length.mm))"
                textFieldYard.text = "\(formatTextFieldValue(data: length.yard))"
                textFieldInch.text = "\(formatTextFieldValue(data: length.inch))"
            case .yard:
                let lengthUnitObjForYard = Measurement(value:doubleTextFieldValue, unit: UnitLength.yards)
                length.yard = lengthUnitObjForYard.value
                length.km = lengthUnitObjForYard.converted(to: .kilometers).value
                length.metre = lengthUnitObjForYard.converted(to: .meters).value
                length.mile = lengthUnitObjForYard.converted(to: .miles).value
                length.cm = lengthUnitObjForYard.converted(to: .centimeters).value
                length.mm = lengthUnitObjForYard.converted(to: .millimeters).value
                length.inch = lengthUnitObjForYard.converted(to: .inches).value
                
                textFieldMetre.text = "\(formatTextFieldValue(data: length.metre))"
                textFieldKm.text = "\(formatTextFieldValue(data: length.km))"
                textFieldMile.text = "\(formatTextFieldValue(data: length.mile))"
                textFieldCm.text = "\(formatTextFieldValue(data: length.cm))"
                textFieldMm.text = "\(formatTextFieldValue(data: length.mm))"
                textFieldInch.text = "\(formatTextFieldValue(data: length.inch))"
            case .inch:
                let lengthUnitObjForInch = Measurement(value:doubleTextFieldValue, unit: UnitLength.inches)
                length.inch = lengthUnitObjForInch.value
                length.km = lengthUnitObjForInch.converted(to: .kilometers).value
                length.metre = lengthUnitObjForInch.converted(to: .millimeters).value
                length.mile = lengthUnitObjForInch.converted(to: .miles).value
                length.cm = lengthUnitObjForInch.converted(to: .centimeters).value
                length.mm = lengthUnitObjForInch.converted(to: .millimeters).value
                length.yard = lengthUnitObjForInch.converted(to: .yards).value
                
                textFieldMetre.text = "\(formatTextFieldValue(data: length.metre))"
                textFieldKm.text = "\(formatTextFieldValue(data: length.km))"
                textFieldMile.text = "\(formatTextFieldValue(data: length.mile))"
                textFieldCm.text = "\(formatTextFieldValue(data: length.cm))"
                textFieldMm.text = "\(formatTextFieldValue(data: length.mm))"
                textFieldInch.text = "\(formatTextFieldValue(data: length.inch))"
            }
        }
        
        
    }
    
    
    @IBAction func saveBtnPressed(_ sender: UIBarButtonItem) {
        
        if(validationCheckForValues()){
            DataManagementStore.saveDataToStore(key: StoreKeys.Length.PRIMARY_KEY, value: creatingHistoryData())
            displayAlertView(alertTitle: Alerts.ValidSaveAttempt.TITLE, alertDescription: Alerts.ValidSaveAttempt.MESSAGE)
        } else {
            displayAlertView(alertTitle: Alerts.InvalidSaveAttempt.TITLE, alertDescription: Alerts.InvalidSaveAttempt.MESSAGE)
        }
    }
    
    @IBAction func historyBtnPressed(_ sender: UIBarButtonItem) {
        let storage = DataManagementStore.getSavedDataFromStore(key: StoreKeys.Length.PRIMARY_KEY)
        if(storage.count > 0){
            // laoding history page with related history data
            let destination = storyboard?.instantiateViewController(withIdentifier: "historyView") as! HistoryViewController
            destination.storage = storage
            destination.storageType = StoreKeys.Length.PRIMARY_KEY
            self.present(destination, animated: true, completion: nil)
        }else{
            displayAlertView(alertTitle: Alerts.NoHistory.TITLE, alertDescription: Alerts.NoHistory.MESSAGE)
        }
    }
    
    // cheking whether all the fields are filled with data 
    func validationCheckForValues() -> Bool {
        if(textFieldCm.text != Constants.DEFAULT_TEXT_FIELD_VALUE && textFieldMm.text != Constants.DEFAULT_TEXT_FIELD_VALUE && textFieldMile.text != "" && textFieldKm.text != Constants.DEFAULT_TEXT_FIELD_VALUE && textFieldMetre.text != Constants.DEFAULT_TEXT_FIELD_VALUE && textFieldYard.text != Constants.DEFAULT_TEXT_FIELD_VALUE && textFieldInch.text != Constants.DEFAULT_TEXT_FIELD_VALUE ){
            return true
        } else{
            return false
        }
    }
    // creating histroy data
    func creatingHistoryData() -> String{
        return "\(NSLocalizedString("LengthHistoryTitleForCentimeters", comment: ""))\(formatTextFieldValue(data: length.cm))\n" +
            "\(NSLocalizedString("LengthHistoryTitleForMillimeters", comment: ""))\(formatTextFieldValue(data: length.mm))\n" +
            "\(NSLocalizedString("LengthHistoryTitleForMiles", comment: ""))\(formatTextFieldValue(data: length.mile))\n" +
            "\(NSLocalizedString("LengthHistoryTitleForKilometers", comment: ""))\(formatTextFieldValue(data: length.km))\n" +
            "\(NSLocalizedString("LengthHistoryTitleForMeters", comment: ""))\(formatTextFieldValue(data: length.metre))\n" +
            "\(NSLocalizedString("LengthHistoryTitleForYards", comment: ""))\(formatTextFieldValue(data: length.yard))\n" +
            "\(NSLocalizedString("LengthHistoryTitleForInches", comment: ""))\(formatTextFieldValue(data: length.inch))"
    }
    
    // saving available data in the text fields when app closing
    func savingDataInAppClose(){
        defaults.set(textFieldCm.text, forKey: StoreKeys.Length.PRESENT_VALUE_CENTIMETER)
        defaults.set(textFieldMm.text, forKey:  StoreKeys.Length.PRESENT_VALUE_MILLIMETER)
        defaults.set(textFieldMile.text, forKey:  StoreKeys.Length.PRESENT_VALUE_MILE)
        defaults.set(textFieldKm.text, forKey:  StoreKeys.Length.PRESENT_VALUE_KILOMETER)
        defaults.set(textFieldMetre.text, forKey:  StoreKeys.Length.PRESENT_VALUE_METRE)
        defaults.set(textFieldYard.text, forKey:  StoreKeys.Length.PRESENT_VALUE_YARD)
        defaults.set(textFieldInch.text, forKey:  StoreKeys.Length.PRESENT_VALUE_INCH)
        defaults.synchronize()
    }
    
    //  retrieving saved data for text fields when app opening
    func retrievingDataInAppOpen(){
        textFieldCm.text = defaults.string(forKey: StoreKeys.Length.PRESENT_VALUE_CENTIMETER)
        textFieldMm.text = defaults.string(forKey: StoreKeys.Length.PRESENT_VALUE_MILLIMETER)
        textFieldMile.text = defaults.string(forKey: StoreKeys.Length.PRESENT_VALUE_MILE)
        textFieldKm.text = defaults.string(forKey: StoreKeys.Length.PRESENT_VALUE_KILOMETER)
        textFieldMetre.text = defaults.string(forKey: StoreKeys.Length.PRESENT_VALUE_METRE)
        textFieldYard.text = defaults.string(forKey: StoreKeys.Length.PRESENT_VALUE_YARD)
        textFieldInch.text = defaults.string(forKey: StoreKeys.Length.PRESENT_VALUE_INCH)
    }
    
    // reseting text fields to default sate
    func resetTextFieldsToDefaultSate(){
        textFieldMetre.text = Constants.DEFAULT_TEXT_FIELD_VALUE
        textFieldKm.text = Constants.DEFAULT_TEXT_FIELD_VALUE
        textFieldMile.text = Constants.DEFAULT_TEXT_FIELD_VALUE
        textFieldCm.text = Constants.DEFAULT_TEXT_FIELD_VALUE
        textFieldMm.text = Constants.DEFAULT_TEXT_FIELD_VALUE
        textFieldYard.text = Constants.DEFAULT_TEXT_FIELD_VALUE
        textFieldInch.text = Constants.DEFAULT_TEXT_FIELD_VALUE
    }
    
    
    // disabling the default keyboard
    func disableDefaultKeyboard(){
        textFieldMetre.inputView = UIView()
        textFieldKm.inputView = UIView()
        textFieldMile.inputView = UIView()
        textFieldCm.inputView = UIView()
        textFieldMm.inputView = UIView()
        textFieldYard.inputView = UIView()
        textFieldInch.inputView = UIView()
    }
    
    // formatting value into 2 decimal points
    func formatTextFieldValue(data : Double) -> String {
        return String(data.roundToDecimal(defaults.integer(forKey: StoreKeys.DECIMAL_VALUE_KEY)))
    }
}
