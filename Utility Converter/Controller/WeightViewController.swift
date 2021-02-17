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
    
    var weight : Weight = Weight(kg: 0.0, grams: 0.0, ounces: 0.0, pounds: 0.0, stonepounds: 0.0)
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
        
        if (sender.text == ""){
            resetTextFieldsToDefaultSate()
        } else {
            guard let textFieldValue = sender.text else { return displayAlert(title: NSLocalizedString("ConvertingFailMsgTitle", comment: ""), message: NSLocalizedString("ConvertingFailMsgDescriptionForCommonUse", comment: "")) }
            guard let doubleTextFieldValue = Double(textFieldValue) else { return displayAlert(title: NSLocalizedString("ConvertingFailMsgTitle", comment: ""), message: NSLocalizedString("ConvertingFailMsgDescriptionForInvalidInput", comment: ""))}
            
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
        var alert : UIAlertController?
        
        if(validationCheckForValues()){
            DataManagementStore.saveDataToStore(key: "weight", value: creatingHistoryData())
            alert = UIAlertController(title: NSLocalizedString("SuccssfullAlertMsgTitle", comment: ""), message: nil, preferredStyle: UIAlertController.Style.alert)
            
        } else {
            alert = UIAlertController(title: NSLocalizedString("FailAlertMsgTitle", comment: ""), message:NSLocalizedString("FailAlertMsgDescription", comment: ""), preferredStyle: UIAlertController.Style.alert)
        }
        
        alert!.addAction(UIAlertAction(title: NSLocalizedString("AlertOkButtonTitle", comment: ""), style: UIAlertAction.Style.default, handler: nil))
        self.present(alert!, animated: true, completion: nil)
    }
    
    @IBAction func historyBtnPressed(_ sender: UIBarButtonItem) {
        let storage = DataManagementStore.getSavedDataFromStore(key: "weight")
        if(storage.count > 0){
            // laoding history page with related history data
            let destination = storyboard?.instantiateViewController(withIdentifier: "historyView") as! HistoryViewController
            destination.storage = storage
            destination.storageType = "weight"
            self.present(destination, animated: true, completion: nil)
        }else{
            let alert = UIAlertController(title: NSLocalizedString("NoHistoryAlertMsgTitle", comment: ""), message: NSLocalizedString("NoHistoryAlertMsgDescription", comment: ""), preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("AlertOkButtonTitle", comment: ""), style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
    // cheking whether all the fields are filled with data
    func validationCheckForValues() -> Bool {
        if(textFieldKg.text != "" && textFieldGram.text != "" && textFieldOunce.text != "" && textFieldPound.text != "" && textFieldStone.text != ""){
            return true
        } else{
            return false
        }
    }
    
    // creating histroy data
    func creatingHistoryData() -> String{
        return "KG --> \(formatTextFieldValue(data: weight.kg))\n" +
            "Grams --> \(formatTextFieldValue(data: weight.grams))\n" +
            "Ounces-> \(formatTextFieldValue(data: weight.ounces))" +
            "Pounds --> \(formatTextFieldValue(data: weight.pounds))\n" +
            "StonePounds --> \(formatTextFieldValue(data: weight.stonepounds))"
    }
    
    // saving available data in the text fields when app closing
    func savingDataInAppClose(){
        defaults.set(textFieldKg.text, forKey: "weight_kg")
        defaults.set(textFieldGram.text, forKey: "weight_grams")
        defaults.set(textFieldOunce.text, forKey: "weight_ounce")
        defaults.set(textFieldPound.text, forKey: "weight_pound")
        defaults.set(textFieldStone.text, forKey: "weight_stone")
        defaults.set(textFieldStonePounds.text, forKey: "weight_stonepounds")
        defaults.synchronize()
    }
    
    //  retrieving saved data for text fields when app opening
    func retrievingDataInAppOpen(){
        textFieldKg.text = defaults.string(forKey: "weight_kg")
        textFieldGram.text = defaults.string(forKey: "weight_grams")
        textFieldOunce.text = defaults.string(forKey: "weight_ounce")
        textFieldPound.text = defaults.string(forKey: "weight_pound")
        textFieldStone.text = defaults.string(forKey: "weight_stone")
        textFieldStonePounds.text = defaults.string(forKey: "weight_stonepounds")
        
    }
    
    // reseting text fields to default sate
    func resetTextFieldsToDefaultSate(){
        textFieldKg.text = ""
        textFieldGram.text = ""
        textFieldOunce.text = ""
        textFieldPound.text = ""
        textFieldStone.text = ""
        textFieldStonePounds.text = ""
        
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
        return String(data.roundToDecimal(defaults.integer(forKey: "roundup_decimalnumber")))
    }
    
}
