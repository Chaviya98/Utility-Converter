//
//  TemperatureViewController.swift
//  Utility Converter
//
//  Created by Chaveen Ellawela on 2021-02-10.
//

import Foundation
import UIKit

enum TemperatureUnits: Int {
    case farenheit, celsius, kelvin
}

class TemperatureViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var textFieldFahrenheit: UITextField!
    @IBOutlet weak var textFieldCelsius: UITextField!
    @IBOutlet weak var textFieldKelvin: UITextField!
    @IBOutlet weak var customKeyboard: CustomKeyboard!
    
    var temperature : Temperature = Temperature(farenheit: 0.0, celsius: 0.0, kelvin: 0.0)
    let defultKelvinValueForCelsius0 : Double = 273.15
    let farenheitValueForCelsius0 : Double = 32.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.assignDelegates()
        resetTextFieldsToDefaultSate()
        disableDefaultKeyboard()
        retrievingDataInAppOpen()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        savingDataInAppClose()
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        customKeyboard.activeTextField = textField
    }
    
    func assignDelegates() {
        textFieldFahrenheit.delegate = self
        textFieldCelsius.delegate = self
        textFieldKelvin.delegate = self
    }
    
    
    @IBAction func temperatureViewTextFieldValueChanged(_ sender: UITextField) {
        
        // validation check for empty text fields
        if (sender.text == ""){
            resetTextFieldsToDefaultSate()
        } else {
            guard let textFieldValue = sender.text else { return }
            guard let doubleTextFieldValue = Double(textFieldValue) else { return }
            
            switch TemperatureUnits(rawValue: sender.tag)! {
            
            case .farenheit:
                temperature.celsius = (doubleTextFieldValue - farenheitValueForCelsius0) * 5/9
                temperature.farenheit = doubleTextFieldValue
                temperature.kelvin = (doubleTextFieldValue - farenheitValueForCelsius0) * 5/9 + defultKelvinValueForCelsius0
                
                textFieldCelsius.text = "\(formatTextFieldValue(data: temperature.celsius))"
                textFieldKelvin.text = "\(formatTextFieldValue(data: temperature.kelvin))"
            case .celsius:
                temperature.celsius = doubleTextFieldValue
                temperature.farenheit = (doubleTextFieldValue * 9/5 + farenheitValueForCelsius0)
                temperature.kelvin = doubleTextFieldValue + defultKelvinValueForCelsius0
                
                textFieldFahrenheit.text = "\(formatTextFieldValue(data: temperature.farenheit))"
                textFieldKelvin.text = "\(formatTextFieldValue(data: temperature.kelvin))"
                
            case .kelvin:
                temperature.celsius = doubleTextFieldValue - defultKelvinValueForCelsius0
                temperature.farenheit = (doubleTextFieldValue - defultKelvinValueForCelsius0) * 9/5 + farenheitValueForCelsius0
                temperature.kelvin = doubleTextFieldValue
                
                textFieldCelsius.text = "\(formatTextFieldValue(data: temperature.celsius))"
                textFieldFahrenheit.text = "\(formatTextFieldValue(data: temperature.farenheit))"
            }
        }
        
    }
    
    // creating histroy data
    func creatingHistoryData() -> String{
        return "Fahrenheit --> \(temperature.farenheit)\n" +
            "Celsius --> \(temperature.celsius)\n" +
            "Kelvin --> \(temperature.kelvin)"
    }
    
    
    @IBAction func saveBtnPressed(_ sender: UIBarButtonItem) {
        
        let alertMessages : [String: String] = ["Succssfully Saved !":"",
                                                "Save Failed !":"Please check the text fields and try again"]
        
        var alert : UIAlertController?
        
        if(textFieldFahrenheit.text != "" && textFieldCelsius.text != "" && textFieldKelvin.text != ""){
            DataManagementStore.saveDataToStore(key: "temperature", value: creatingHistoryData())
            alert = UIAlertController(title: Array(alertMessages)[0].key, message: Array(alertMessages)[0].value, preferredStyle: UIAlertController.Style.alert)
            
        } else {
            alert = UIAlertController(title: Array(alertMessages)[1].key, message: Array(alertMessages)[1].value, preferredStyle: UIAlertController.Style.alert)
        }
        
        
        alert!.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert!, animated: true, completion: nil)
    }
    
    
    @IBAction func historyBtnPressed(_ sender: UIBarButtonItem) {
        
        let storage = DataManagementStore.getSavedDataFromStore(key: "temperature")
        let alertMessages : [String: String] = ["No History !":"No saved history found. Plase click save to add calculations to history."]
        if(storage.count > 0){
            // laoding history page with related history data
            let destination = storyboard?.instantiateViewController(withIdentifier: "historyView") as! HistoryViewController
            destination.storage = storage
            self.present(destination, animated: true, completion: nil)
        }else{
            let alert = UIAlertController(title: Array(alertMessages)[0].key, message: Array(alertMessages)[0].value, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
    
    // saving available data in the text fields when app closing
    func savingDataInAppClose(){
        let defaults = UserDefaults.standard
        defaults.set(textFieldFahrenheit.text, forKey: "temperature_fahrenheit")
        defaults.set(textFieldCelsius.text, forKey: "temperature_celsius")
        defaults.set(textFieldKelvin.text, forKey: "temperature_kelvin")
        defaults.synchronize()
    }
    
    //  retrieving saved data for text fields when app opening
    func retrievingDataInAppOpen(){
        let defaults = UserDefaults.standard
        textFieldFahrenheit.text = defaults.string(forKey: "temperature_fahrenheit")
        textFieldCelsius.text = defaults.string(forKey: "temperature_celsius")
        textFieldKelvin.text = defaults.string(forKey: "temperature_kelvin")
        
    }
    
    // reseting text fields to default sate
    func resetTextFieldsToDefaultSate(){
        textFieldFahrenheit.text = ""
        textFieldCelsius.text = ""
        textFieldKelvin.text = ""
        textFieldFahrenheit.placeholder = "0"
        textFieldCelsius.placeholder = "0"
        textFieldKelvin.placeholder = "0"
    }
    
    // disabling the default keyboard
    func disableDefaultKeyboard(){
        textFieldFahrenheit.inputView = UIView()
        textFieldCelsius.inputView = UIView()
        textFieldKelvin.inputView = UIView()
    }
    
    // formatting value into 2 decimal points
    func formatTextFieldValue(data : Double) -> String {
        return String(format: "%.2f", data)
    }
    
}
