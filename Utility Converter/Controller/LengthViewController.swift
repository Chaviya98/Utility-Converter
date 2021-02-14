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
    
    var length : Length = Length(cm: 0.0, mm: 0.0, mile: 0.0, km: 0.0, metre: 0.0, yard: 0.0, inch: 0.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.assignDelegates()
        resetTextFieldsToDefaultSate()
        disableDefaultKeyboard()
        retrievingDataInAppOpen()
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
        if (sender.text == ""){
            resetTextFieldsToDefaultSate()
        } else {
            guard let textFieldValue = sender.text else { return }
            guard let doubleTextFieldValue = Double(textFieldValue) else { return }
            
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
        var alert : UIAlertController?
        
        if(validationCheckForValues()){
            DataManagementStore.saveDataToStore(key: "length", value: creatingHistoryData())
            alert = UIAlertController(title: NSLocalizedString("SuccssfullAlertMsgTitle", comment: ""), message: nil, preferredStyle: UIAlertController.Style.alert)
            
        } else {
            alert = UIAlertController(title: NSLocalizedString("FailAlertMsgTitle", comment: ""), message:NSLocalizedString("FailAlertMsgDescription", comment: ""), preferredStyle: UIAlertController.Style.alert)
        }
        
        alert!.addAction(UIAlertAction(title: NSLocalizedString("AlertOkButtonTitle", comment: ""), style: UIAlertAction.Style.default, handler: nil))
        self.present(alert!, animated: true, completion: nil)
    }
    
    @IBAction func historyBtnPressed(_ sender: UIBarButtonItem) {
        let storage = DataManagementStore.getSavedDataFromStore(key: "length")
        if(storage.count > 0){
            // laoding history page with related history data
            let destination = storyboard?.instantiateViewController(withIdentifier: "historyView") as! HistoryViewController
            destination.storage = storage
            self.present(destination, animated: true, completion: nil)
        }else{
            let alert = UIAlertController(title: NSLocalizedString("NoHistoryAlertMsgTitle", comment: ""), message: NSLocalizedString("NoHistoryAlertMsgDescription", comment: ""), preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("AlertOkButtonTitle", comment: ""), style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    // cheking whether all the fields are filled with data 
    func validationCheckForValues() -> Bool {
        if(textFieldCm.text != "" && textFieldMm.text != "" && textFieldMile.text != "" && textFieldKm.text != "" && textFieldMetre.text != "" && textFieldYard.text != "" && textFieldInch.text != "" ){
            return true
        } else{
            return false
        }
    }
    // creating histroy data
    func creatingHistoryData() -> String{
        return "Centimeters --> \(length.cm)\n" +
            "Millimeters --> \(length.mm)\n" +
            "Miles --> \(length.mile)\n" +
            "Kilometers --> \(length.km)\n" +
            "Meters --> \(length.metre)\n" +
            "Yards --> \(length.yard)\n" +
            "Inches --> \(length.inch)"
    }
    
    // saving available data in the text fields when app closing
    func savingDataInAppClose(){
        let defaults = UserDefaults.standard
        defaults.set(textFieldCm.text, forKey: "length_centimeter")
        defaults.set(textFieldMm.text, forKey: "length_millimeter")
        defaults.set(textFieldMile.text, forKey: "length_mile")
        defaults.set(textFieldKm.text, forKey: "length_kilometer")
        defaults.set(textFieldMetre.text, forKey: "length_metre")
        defaults.set(textFieldYard.text, forKey: "length_yard")
        defaults.set(textFieldInch.text, forKey: "length_inch")
        defaults.synchronize()
    }
    
    //  retrieving saved data for text fields when app opening
    func retrievingDataInAppOpen(){
        let defaults = UserDefaults.standard
        textFieldCm.text = defaults.string(forKey: "length_centimeter")
        textFieldMm.text = defaults.string(forKey: "length_millimeter")
        textFieldMile.text = defaults.string(forKey: "length_mile")
        textFieldKm.text = defaults.string(forKey: "length_kilometer")
        textFieldMetre.text = defaults.string(forKey: "length_metre")
        textFieldYard.text = defaults.string(forKey: "length_yard")
        textFieldInch.text = defaults.string(forKey: "length_inch")
    }
    
    // reseting text fields to default sate
    func resetTextFieldsToDefaultSate(){
        textFieldMetre.text = ""
        textFieldKm.text = ""
        textFieldMile.text = ""
        textFieldCm.text = ""
        textFieldMm.text = ""
        textFieldYard.text = ""
        textFieldInch.text = ""
        
        textFieldMetre.placeholder = "0"
        textFieldKm.placeholder = "0"
        textFieldMile.placeholder = "0"
        textFieldCm.placeholder = "0"
        textFieldMm.placeholder = "0"
        textFieldYard.placeholder = "0"
        textFieldInch.placeholder = "0"
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
        return String(format: "%.3f", data)
    }
}
