//
//  WeightViewController.swift
//  Utility Converter
//
//  Created by Chaveen Ellawela on 2021-02-14.
//

import Foundation
import UIKit

enum WeightUnits: Int {
    case kg, grams, ounces, pounds, stone, stonepounds
}

class WeightViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var textFieldKg: UITextField!
    @IBOutlet weak var textFieldGram: UITextField!
    @IBOutlet weak var textFieldOunce: UITextField!
    @IBOutlet weak var textFieldPound: UITextField!
    @IBOutlet weak var textFieldStone: UITextField!
    @IBOutlet weak var textFieldStonePounds: UITextField!
    @IBOutlet weak var customKeyboard: CustomKeyboard!
    
    var weight : Weight = Weight()
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
        textFieldKg.layer.borderWidth = 1
        textFieldKg.layer.borderColor = UIColor.darkGray.cgColor
        textFieldKg.layer.cornerRadius = 10
        
        textFieldGram.layer.borderWidth = 1
        textFieldGram.layer.borderColor = UIColor.darkGray.cgColor
        textFieldGram.layer.cornerRadius = 10
        
        textFieldOunce.layer.borderWidth = 1
        textFieldOunce.layer.borderColor = UIColor.darkGray.cgColor
        textFieldOunce.layer.cornerRadius = 10
        
        textFieldPound.layer.borderWidth = 1
        textFieldPound.layer.borderColor = UIColor.darkGray.cgColor
        textFieldPound.layer.cornerRadius = 10
        
        textFieldStone.layer.borderWidth = 1
        textFieldStone.layer.borderColor = UIColor.darkGray.cgColor
        textFieldStone.layer.cornerRadius = 10
        
        textFieldStonePounds.layer.borderWidth = 1
        textFieldStonePounds.layer.borderColor = UIColor.darkGray.cgColor
        textFieldStonePounds.layer.cornerRadius = 10
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        savingDataInAppClose()
        
    }
    func assignDelegates() {
        textFieldKg.delegate = self
        textFieldGram.delegate = self
        textFieldOunce.delegate = self
        textFieldPound.delegate = self
        textFieldStone.delegate = self
        textFieldStonePounds.delegate = self
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        customKeyboard.activeTextField = textField
    }
    
    @IBAction func weightViewTextFieldValueChanged(_ sender: UITextField) {
        
        // validation check for empty text fields
        
        if (sender.text == Constants.DEFAULT_TEXT_FIELD_VALUE){
            resetTextFieldsToDefaultSate()
        } else {
            guard let textFieldValue = sender.text else { return displayAlertView(alertTitle: Alerts.CommonAlert.TITLE, alertDescription: Alerts.CommonAlert.MESSAGE) }
            guard let doubleTextFieldValue = Double(textFieldValue) else { return displayAlertView(alertTitle: Alerts.InvalidParameters.TITLE, alertDescription: Alerts.InvalidParameters.MESSAGE) }
            
            switch WeightUnits(rawValue: sender.tag)! {
            
            case .kg:
                let weightUnitObjForKilogram = Measurement(value:doubleTextFieldValue, unit: UnitMass.kilograms)
                weight.kg = weightUnitObjForKilogram.value
                weight.grams = weightUnitObjForKilogram.converted(to: .grams).value
                weight.ounces = weightUnitObjForKilogram.converted(to: .ounces).value
                weight.pounds = weightUnitObjForKilogram.converted(to: .pounds).value
                weight.stonepounds = weightUnitObjForKilogram.converted(to: .stones).value
                
                textFieldGram.text = "\(formatTextFieldValue(data: weight.grams))"
                textFieldOunce.text = "\(formatTextFieldValue(data: weight.ounces))"
                textFieldPound.text = "\(formatTextFieldValue(data: weight.pounds))"
                textFieldStone.text = "\(Int(weight.stonepounds))"
                textFieldStonePounds.text = "\(formatTextFieldValue(data: weight.stonepounds.truncatingRemainder(dividingBy: 1)))"
                
            case .grams:
                let weightUnitObjForGram = Measurement(value:doubleTextFieldValue, unit: UnitMass.grams)
                weight.grams = weightUnitObjForGram.value
                weight.kg = weightUnitObjForGram.converted(to: .kilograms).value
                weight.ounces = weightUnitObjForGram.converted(to: .ounces).value
                weight.pounds = weightUnitObjForGram.converted(to: .pounds).value
                weight.stonepounds = weightUnitObjForGram.converted(to: .stones).value
                
                
                textFieldKg.text = "\(formatTextFieldValue(data: weight.kg))"
                textFieldOunce.text = "\(formatTextFieldValue(data: weight.ounces))"
                textFieldPound.text = "\(formatTextFieldValue(data: weight.pounds))"
                textFieldStone.text = "\(Int(weight.stonepounds))"
                textFieldStonePounds.text = "\(formatTextFieldValue(data: weight.stonepounds.truncatingRemainder(dividingBy: 1)))"
            case .ounces:
                let weightUnitObjForOunce = Measurement(value:doubleTextFieldValue, unit: UnitMass.ounces)
                weight.ounces = weightUnitObjForOunce.value
                weight.grams = weightUnitObjForOunce.converted(to: .grams).value
                weight.kg = weightUnitObjForOunce.converted(to: .kilograms).value
                weight.pounds = weightUnitObjForOunce.converted(to: .pounds).value
                weight.stonepounds = weightUnitObjForOunce.converted(to: .stones).value
                
                textFieldKg.text = "\(formatTextFieldValue(data: weight.kg))"
                textFieldGram.text = "\(formatTextFieldValue(data: weight.grams))"
                textFieldPound.text = "\(formatTextFieldValue(data: weight.pounds))"
                textFieldStone.text = "\(Int(weight.stonepounds))"
                textFieldStonePounds.text = "\(formatTextFieldValue(data: weight.stonepounds.truncatingRemainder(dividingBy: 1)))"
            case .pounds:
                let weightUnitObjForPound = Measurement(value:doubleTextFieldValue, unit: UnitMass.pounds)
                weight.pounds = weightUnitObjForPound.value
                weight.grams = weightUnitObjForPound.converted(to: .grams).value
                weight.kg = weightUnitObjForPound.converted(to: .kilograms).value
                weight.ounces = weightUnitObjForPound.converted(to: .ounces).value
                weight.stonepounds = weightUnitObjForPound.converted(to: .stones).value
                
                textFieldKg.text = "\(formatTextFieldValue(data: weight.kg))"
                textFieldGram.text = "\(formatTextFieldValue(data: weight.grams))"
                textFieldOunce.text = "\(formatTextFieldValue(data: weight.ounces))"
                textFieldStone.text = "\(Int(weight.stonepounds))"
                textFieldStonePounds.text = "\(formatTextFieldValue(data: weight.stonepounds.truncatingRemainder(dividingBy: 1)))"
            case .stone:
                let weightUnitObjForStones = Measurement(value:doubleTextFieldValue, unit: UnitMass.stones)
                weight.stonepounds = weightUnitObjForStones.value
                weight.grams = weightUnitObjForStones.converted(to: .grams).value
                weight.kg = weightUnitObjForStones.converted(to: .kilograms).value
                weight.ounces = weightUnitObjForStones.converted(to: .ounces).value
                weight.pounds = weightUnitObjForStones.converted(to: .pounds).value
                
                
                textFieldKg.text = "\(formatTextFieldValue(data: weight.kg))"
                textFieldGram.text = "\(formatTextFieldValue(data: weight.grams))"
                textFieldOunce.text = "\(formatTextFieldValue(data: weight.ounces))"
                textFieldPound.text = "\(formatTextFieldValue(data: weight.pounds))"
                
            case .stonepounds:
                var weightUnitObjForStones : Measurement<UnitMass>?
                if(textFieldStone.text == ""){
                    weightUnitObjForStones = Measurement(value:doubleTextFieldValue, unit: UnitMass.stones)
                    
                } else {
                    let stonePoundFullValue = doubleTextFieldValue + Double(textFieldStone.text!)!
                    weightUnitObjForStones = Measurement(value:stonePoundFullValue, unit: UnitMass.stones)
                }
                
                weight.stonepounds = weightUnitObjForStones!.value
                weight.grams = weightUnitObjForStones!.converted(to: .grams).value
                weight.kg = weightUnitObjForStones!.converted(to: .kilograms).value
                weight.ounces = weightUnitObjForStones!.converted(to: .ounces).value
                weight.pounds = weightUnitObjForStones!.converted(to: .pounds).value
                
                textFieldKg.text = "\(formatTextFieldValue(data: weight.kg))"
                textFieldGram.text = "\(formatTextFieldValue(data: weight.grams))"
                textFieldOunce.text = "\(formatTextFieldValue(data: weight.ounces))"
                textFieldPound.text = "\(formatTextFieldValue(data: weight.pounds))"
                
                if(textFieldStone.text == ""){
                    textFieldStone.text = "\(Int(weight.stonepounds))"
                }
            }
        }
    }
    
    
    @IBAction func saveBtnPressed(_ sender: UIBarButtonItem) {
        
        if(validationCheckForValues()){
            DataManagementStore.saveDataToStore(key: StoreKeys.Weight.PRIMARY_KEY, value: weight.getWeightData())
            displayAlertView(alertTitle: Alerts.ValidSaveAttempt.TITLE, alertDescription: Alerts.ValidSaveAttempt.MESSAGE)
        } else {
            displayAlertView(alertTitle: Alerts.InvalidSaveAttempt.TITLE, alertDescription: Alerts.InvalidSaveAttempt.MESSAGE)
        }
    }
    
    @IBAction func historyBtnPressed(_ sender: UIBarButtonItem) {
        let storage = DataManagementStore.getSavedDataFromStore(key: StoreKeys.Weight.PRIMARY_KEY)
        if(storage.count > 0){
            // laoding history page with related history data
            let destination = storyboard?.instantiateViewController(withIdentifier: "historyView") as! HistoryViewController
            destination.storage = storage
            destination.storageType = StoreKeys.Weight.PRIMARY_KEY
            self.present(destination, animated: true, completion: nil)
        }else{
            displayAlertView(alertTitle: Alerts.NoHistory.TITLE, alertDescription: Alerts.NoHistory.MESSAGE)
        }
    }
    
    
    // cheking whether all the fields are filled with data
    func validationCheckForValues() -> Bool {
        if(textFieldKg.text != Constants.DEFAULT_TEXT_FIELD_VALUE && textFieldGram.text != Constants.DEFAULT_TEXT_FIELD_VALUE && textFieldOunce.text != Constants.DEFAULT_TEXT_FIELD_VALUE && textFieldPound.text != Constants.DEFAULT_TEXT_FIELD_VALUE && textFieldStone.text != Constants.DEFAULT_TEXT_FIELD_VALUE){
            return true
        } else{
            return false
        }
    }
    
    
    // saving available data in the text fields when app closing
    func savingDataInAppClose(){
        defaults.set(textFieldKg.text, forKey: StoreKeys.Weight.PRESENT_VALUE_KILOGRAMS)
        defaults.set(textFieldGram.text, forKey: StoreKeys.Weight.PRESENT_VALUE_GRAMS)
        defaults.set(textFieldOunce.text, forKey: StoreKeys.Weight.PRESENT_VALUE_OUNCE)
        defaults.set(textFieldPound.text, forKey: StoreKeys.Weight.PRESENT_VALUE_POUND)
        defaults.set(textFieldStone.text, forKey: StoreKeys.Weight.PRESENT_VALUE_STONE)
        defaults.set(textFieldStonePounds.text, forKey: StoreKeys.Weight.PRESENT_VALUE_STONEPOUNDS)
        defaults.synchronize()
    }
    
    //  retrieving saved data for text fields when app opening
    func retrievingDataInAppOpen(){
        textFieldKg.text = defaults.string(forKey: StoreKeys.Weight.PRESENT_VALUE_KILOGRAMS)
        textFieldGram.text = defaults.string(forKey: StoreKeys.Weight.PRESENT_VALUE_GRAMS)
        textFieldOunce.text = defaults.string(forKey: StoreKeys.Weight.PRESENT_VALUE_OUNCE)
        textFieldPound.text = defaults.string(forKey: StoreKeys.Weight.PRESENT_VALUE_POUND)
        textFieldStone.text = defaults.string(forKey: StoreKeys.Weight.PRESENT_VALUE_STONE)
        textFieldStonePounds.text = defaults.string(forKey: StoreKeys.Weight.PRESENT_VALUE_STONEPOUNDS)
        
    }
    
    // reseting text fields to default sate
    func resetTextFieldsToDefaultSate(){
        textFieldKg.text = Constants.DEFAULT_TEXT_FIELD_VALUE
        textFieldGram.text = Constants.DEFAULT_TEXT_FIELD_VALUE
        textFieldOunce.text = Constants.DEFAULT_TEXT_FIELD_VALUE
        textFieldPound.text = Constants.DEFAULT_TEXT_FIELD_VALUE
        textFieldStone.text = Constants.DEFAULT_TEXT_FIELD_VALUE
        textFieldStonePounds.text = Constants.DEFAULT_TEXT_FIELD_VALUE
        
    }
    // disabling the default keyboard
    func disableDefaultKeyboard(){
        textFieldKg.inputView = UIView()
        textFieldGram.inputView = UIView()
        textFieldOunce.inputView = UIView()
        textFieldPound.inputView = UIView()
        textFieldStone.inputView = UIView()
        textFieldStonePounds.inputView = UIView()
    }
    
    // formatting value into 2 decimal points
    func formatTextFieldValue(data : Double) -> String {
        return String(data.roundToDecimal(defaults.integer(forKey: StoreKeys.DECIMAL_VALUE_KEY)))
    }
    
}
