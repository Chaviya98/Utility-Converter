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
    
    var weight : Weight = Weight(Kg: 0.0, Grams: 0.0, Ounces: 0.0, Pounds: 0.0, Stonepounds: 0.0)
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
            guard let textFieldValue = sender.text else { return }
            guard let doubleTextFieldValue = Double(textFieldValue) else { return }
            
            switch WeightUnits(rawValue: sender.tag)! {
            
            case .kg:
                let weightUnitObjForKilogram = Measurement(value:doubleTextFieldValue, unit: UnitMass.kilograms)
                weight.Kg = weightUnitObjForKilogram.value
                weight.Grams = weightUnitObjForKilogram.converted(to: .grams).value
                weight.Ounces = weightUnitObjForKilogram.converted(to: .ounces).value
                weight.Pounds = weightUnitObjForKilogram.converted(to: .pounds).value
                weight.Stonepounds = weightUnitObjForKilogram.converted(to: .stones).value
                
                textFieldGram.text = "\(formatTextFieldValue(data: weight.Grams))"
                textFieldOunce.text = "\(formatTextFieldValue(data: weight.Ounces))"
                textFieldPound.text = "\(formatTextFieldValue(data: weight.Pounds))"
                textFieldStone.text = "\(Int(weight.Stonepounds))"
                textFieldStonePounds.text = "\(formatTextFieldValue(data: weight.Stonepounds.truncatingRemainder(dividingBy: 1)))"
                
            case .grams:
                let weightUnitObjForGram = Measurement(value:doubleTextFieldValue, unit: UnitMass.grams)
                weight.Grams = weightUnitObjForGram.value
                weight.Kg = weightUnitObjForGram.converted(to: .kilograms).value
                weight.Ounces = weightUnitObjForGram.converted(to: .ounces).value
                weight.Pounds = weightUnitObjForGram.converted(to: .pounds).value
                weight.Stonepounds = weightUnitObjForGram.converted(to: .stones).value
                
                
                textFieldKg.text = "\(formatTextFieldValue(data: weight.Kg))"
                textFieldOunce.text = "\(formatTextFieldValue(data: weight.Ounces))"
                textFieldPound.text = "\(formatTextFieldValue(data: weight.Pounds))"
                textFieldStone.text = "\(Int(weight.Stonepounds))"
                textFieldStonePounds.text = "\(formatTextFieldValue(data: weight.Stonepounds.truncatingRemainder(dividingBy: 1)))"
            case .ounces:
                let weightUnitObjForOunce = Measurement(value:doubleTextFieldValue, unit: UnitMass.ounces)
                weight.Ounces = weightUnitObjForOunce.value
                weight.Grams = weightUnitObjForOunce.converted(to: .grams).value
                weight.Kg = weightUnitObjForOunce.converted(to: .kilograms).value
                weight.Pounds = weightUnitObjForOunce.converted(to: .pounds).value
                weight.Stonepounds = weightUnitObjForOunce.converted(to: .stones).value
                
                textFieldKg.text = "\(formatTextFieldValue(data: weight.Kg))"
                textFieldGram.text = "\(formatTextFieldValue(data: weight.Grams))"
                textFieldPound.text = "\(formatTextFieldValue(data: weight.Pounds))"
                textFieldStone.text = "\(Int(weight.Stonepounds))"
                textFieldStonePounds.text = "\(formatTextFieldValue(data: weight.Stonepounds.truncatingRemainder(dividingBy: 1)))"
            case .pounds:
                let weightUnitObjForPound = Measurement(value:doubleTextFieldValue, unit: UnitMass.pounds)
                weight.Pounds = weightUnitObjForPound.value
                weight.Grams = weightUnitObjForPound.converted(to: .grams).value
                weight.Kg = weightUnitObjForPound.converted(to: .kilograms).value
                weight.Ounces = weightUnitObjForPound.converted(to: .ounces).value
                weight.Stonepounds = weightUnitObjForPound.converted(to: .stones).value
                
                textFieldKg.text = "\(formatTextFieldValue(data: weight.Kg))"
                textFieldGram.text = "\(formatTextFieldValue(data: weight.Grams))"
                textFieldOunce.text = "\(formatTextFieldValue(data: weight.Ounces))"
                textFieldStone.text = "\(Int(weight.Stonepounds))"
                textFieldStonePounds.text = "\(formatTextFieldValue(data: weight.Stonepounds.truncatingRemainder(dividingBy: 1)))"
            case .stone:
                let weightUnitObjForStones = Measurement(value:doubleTextFieldValue, unit: UnitMass.stones)
                weight.Stonepounds = weightUnitObjForStones.value
                weight.Grams = weightUnitObjForStones.converted(to: .grams).value
                weight.Kg = weightUnitObjForStones.converted(to: .kilograms).value
                weight.Ounces = weightUnitObjForStones.converted(to: .ounces).value
                weight.Pounds = weightUnitObjForStones.converted(to: .pounds).value
                
                
                textFieldKg.text = "\(formatTextFieldValue(data: weight.Kg))"
                textFieldGram.text = "\(formatTextFieldValue(data: weight.Grams))"
                textFieldOunce.text = "\(formatTextFieldValue(data: weight.Ounces))"
                textFieldPound.text = "\(formatTextFieldValue(data: weight.Pounds))"
                
            case .stonepounds:
                var weightUnitObjForStones : Measurement<UnitMass>?
                if(textFieldStone.text == ""){
                    weightUnitObjForStones = Measurement(value:doubleTextFieldValue, unit: UnitMass.stones)
                    
                } else {
                    let stonePoundFullValue = doubleTextFieldValue + Double(textFieldStone.text!)!
                    weightUnitObjForStones = Measurement(value:stonePoundFullValue, unit: UnitMass.stones)
                }
                
                weight.Stonepounds = weightUnitObjForStones!.value
                weight.Grams = weightUnitObjForStones!.converted(to: .grams).value
                weight.Kg = weightUnitObjForStones!.converted(to: .kilograms).value
                weight.Ounces = weightUnitObjForStones!.converted(to: .ounces).value
                weight.Pounds = weightUnitObjForStones!.converted(to: .pounds).value
                
                textFieldKg.text = "\(formatTextFieldValue(data: weight.Kg))"
                textFieldGram.text = "\(formatTextFieldValue(data: weight.Grams))"
                textFieldOunce.text = "\(formatTextFieldValue(data: weight.Ounces))"
                textFieldPound.text = "\(formatTextFieldValue(data: weight.Pounds))"
                
                if(textFieldStone.text == ""){
                    textFieldStone.text = "\(Int(weight.Stonepounds))"
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
        return "KG --> \(formatTextFieldValue(data: weight.Kg))\n" +
            "Grams --> \(formatTextFieldValue(data: weight.Grams))\n" +
            "Ounces-> \(formatTextFieldValue(data: weight.Ounces))" +
            "Pounds --> \(formatTextFieldValue(data: weight.Pounds))\n" +
            "StonePounds --> \(formatTextFieldValue(data: weight.Stonepounds))"
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
