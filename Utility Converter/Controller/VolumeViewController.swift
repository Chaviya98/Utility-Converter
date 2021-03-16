//
//  VolumeViewController.swift
//  Utility Converter
//
//  Created by Chaveen Ellawela on 2021-02-16.
//

import Foundation
import UIKit

enum fields: Int {
    case inputField1, inputField2, inputField3, inputField4, inputField5
}

class VolumeViewController : UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var optionSegementController: UISegmentedControl!
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textField3: UITextField!
    @IBOutlet weak var textField4: UITextField!
    @IBOutlet weak var textField5: UITextField!
    
    @IBOutlet weak var textField1Label: UILabel!
    @IBOutlet weak var textField2Label: UILabel!
    @IBOutlet weak var textField3Label: UILabel!
    @IBOutlet weak var textField4Label: UILabel!
    @IBOutlet weak var textField5Label: UILabel!
    
    @IBOutlet weak var customKeyboard: CustomKeyboard!
    
    
    var liquid : Liquid = Liquid()
    var cube : Cube = Cube()
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
        textField1.layer.borderWidth = 1
        textField1.layer.borderColor = UIColor.darkGray.cgColor
        textField1.layer.cornerRadius = 10
        
        textField2.layer.borderWidth = 1
        textField2.layer.borderColor = UIColor.darkGray.cgColor
        textField2.layer.cornerRadius = 10
        
        textField3.layer.borderWidth = 1
        textField3.layer.borderColor = UIColor.darkGray.cgColor
        textField3.layer.cornerRadius = 10
        
        textField4.layer.borderWidth = 1
        textField4.layer.borderColor = UIColor.darkGray.cgColor
        textField4.layer.cornerRadius = 10
        
        textField5.layer.borderWidth = 1
        textField5.layer.borderColor = UIColor.darkGray.cgColor
        textField5.layer.cornerRadius = 10
        
        textFieldLableValueChanger()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        savingDataInAppClose()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        customKeyboard.activeTextField = textField
    }
    
    func assignDelegates() {
        textField1.delegate = self
        textField2.delegate = self
        textField3.delegate = self
        textField4.delegate = self
        textField5.delegate = self
    }
    
    @IBAction func segementControllerValueChanged(_ sender: UISegmentedControl) {
        
        if(optionSegementController.selectedSegmentIndex == 0){
            defaults.set(1, forKey: StoreKeys.SEGEMENT_CONTROLLER_KEY_VOLUME)
        }else{
            defaults.set(2, forKey: StoreKeys.SEGEMENT_CONTROLLER_KEY_VOLUME)
        }
        resetTextFieldsToDefaultSate()
        textFieldLableValueChanger()
        
    }
    
    private func textFieldLableValueChanger(){
        if(defaults.integer(forKey: StoreKeys.SEGEMENT_CONTROLLER_KEY_VOLUME) == 1){
            optionSegementController.selectedSegmentIndex = 0
            textField1Label.text = "Uk Gallon"
            textField2Label.text = "Litre"
            textField3Label.text = "UK Pint"
            textField4Label.text = "Fuild Ounce"
            textField5Label.text = "Mililiter"
            
        }else{
            optionSegementController.selectedSegmentIndex = 1
            textField1Label.text = "CM"
            textField2Label.text = "MM"
            textField3Label.text = "Mile"
            textField4Label.text = "KM"
            textField5Label.text = "Metre"
        }
    }
    
    @IBAction func textFieldValueChanged(_ sender: UITextField) {
        
        // validation check for empty text fields
        if (sender.text == Constants.DEFAULT_TEXT_FIELD_VALUE){
            resetTextFieldsToDefaultSate()
        } else {
            guard let textFieldValue = sender.text else { return displayAlertView(alertTitle: Alerts.CommonAlert.TITLE, alertDescription: Alerts.CommonAlert.MESSAGE)}
            guard let doubleTextFieldValue = Double(textFieldValue) else {  return displayAlertView(alertTitle: Alerts.InvalidParameters.TITLE, alertDescription: Alerts.InvalidParameters.MESSAGE) }
            
            switch fields(rawValue: sender.tag)! {
            
            case .inputField1:
                if(optionSegementController.selectedSegmentIndex == 0){
                    let liquidUnitObjForGallons = Measurement(value:doubleTextFieldValue, unit: UnitVolume.gallons)
                    liquid.ukGallon = liquidUnitObjForGallons.value
                    liquid.litre = liquidUnitObjForGallons.converted(to: .liters).value
                    liquid.ukPint = liquidUnitObjForGallons.converted(to: .pints).value
                    liquid.fluidOunce = liquidUnitObjForGallons.converted(to: .fluidOunces).value
                    liquid.millilitre = liquidUnitObjForGallons.converted(to: .milliliters).value
                    textField2.text = "\(formatTextFieldValue(data: liquid.litre))"
                    textField3.text = "\(formatTextFieldValue(data: liquid.ukPint))"
                    textField4.text = "\(formatTextFieldValue(data: liquid.fluidOunce))"
                    textField5.text = "\(formatTextFieldValue(data: liquid.millilitre))"
                    
                }else {
                    let cubeUnitObjForCubicCentimeters = Measurement(value:doubleTextFieldValue, unit: UnitVolume.cubicCentimeters)
                    cube.cm = cubeUnitObjForCubicCentimeters.value
                    cube.mm = cubeUnitObjForCubicCentimeters.converted(to: .cubicMillimeters).value
                    cube.mile = cubeUnitObjForCubicCentimeters.converted(to: .cubicMiles).value
                    cube.km = cubeUnitObjForCubicCentimeters.converted(to: .cubicKilometers).value
                    cube.metre = cubeUnitObjForCubicCentimeters.converted(to: .cubicMeters).value
                    textField2.text = "\(formatTextFieldValue(data: cube.mm))"
                    textField3.text = "\(formatTextFieldValue(data: cube.mile))"
                    textField4.text = "\(formatTextFieldValue(data: cube.km))"
                    textField5.text = "\(formatTextFieldValue(data: cube.metre))"
                }
            case .inputField2:
                if(optionSegementController.selectedSegmentIndex == 0){
                    let liquidUnitObjForLiters = Measurement(value:doubleTextFieldValue, unit: UnitVolume.liters)
                    liquid.litre = liquidUnitObjForLiters.value
                    liquid.ukGallon = liquidUnitObjForLiters.converted(to: .gallons).value
                    liquid.ukPint = liquidUnitObjForLiters.converted(to: .pints).value
                    liquid.fluidOunce = liquidUnitObjForLiters.converted(to: .fluidOunces).value
                    liquid.millilitre = liquidUnitObjForLiters.converted(to: .milliliters).value
                    textField1.text = "\(formatTextFieldValue(data: liquid.ukGallon))"
                    textField3.text = "\(formatTextFieldValue(data: liquid.ukPint))"
                    textField4.text = "\(formatTextFieldValue(data: liquid.fluidOunce))"
                    textField5.text = "\(formatTextFieldValue(data: liquid.millilitre))"
                }else {
                    let cubeUnitObjForCubicMillimeters = Measurement(value:doubleTextFieldValue, unit: UnitVolume.cubicMillimeters)
                    cube.mm = cubeUnitObjForCubicMillimeters.value
                    cube.cm = cubeUnitObjForCubicMillimeters.converted(to: .cubicCentimeters).value
                    cube.mile = cubeUnitObjForCubicMillimeters.converted(to: .cubicMiles).value
                    cube.km = cubeUnitObjForCubicMillimeters.converted(to: .cubicKilometers).value
                    cube.metre = cubeUnitObjForCubicMillimeters.converted(to: .cubicMeters).value
                    textField1.text = "\(formatTextFieldValue(data: cube.cm))"
                    textField3.text = "\(formatTextFieldValue(data: cube.mile))"
                    textField4.text = "\(formatTextFieldValue(data: cube.km))"
                    textField5.text = "\(formatTextFieldValue(data: cube.metre))"
                }
            case .inputField3:
                if(optionSegementController.selectedSegmentIndex == 0){
                    let liquidUnitObjForPints = Measurement(value:doubleTextFieldValue, unit: UnitVolume.pints)
                    liquid.ukPint = liquidUnitObjForPints.value
                    liquid.litre = liquidUnitObjForPints.converted(to: .liters).value
                    liquid.ukGallon = liquidUnitObjForPints.converted(to: .gallons).value
                    liquid.fluidOunce = liquidUnitObjForPints.converted(to: .fluidOunces).value
                    liquid.millilitre = liquidUnitObjForPints.converted(to: .milliliters).value
                    textField1.text = "\(formatTextFieldValue(data: liquid.ukGallon))"
                    textField2.text = "\(formatTextFieldValue(data: liquid.litre))"
                    textField4.text = "\(formatTextFieldValue(data: liquid.fluidOunce))"
                    textField5.text = "\(formatTextFieldValue(data: liquid.millilitre))"
                }else {
                    let cubeUnitObjForCubicMiles = Measurement(value:doubleTextFieldValue, unit: UnitVolume.cubicMiles)
                    cube.mile = cubeUnitObjForCubicMiles.value
                    cube.mm = cubeUnitObjForCubicMiles.converted(to: .cubicMillimeters).value
                    cube.cm = cubeUnitObjForCubicMiles.converted(to: .cubicCentimeters).value
                    cube.km = cubeUnitObjForCubicMiles.converted(to: .cubicKilometers).value
                    cube.metre = cubeUnitObjForCubicMiles.converted(to: .cubicMeters).value
                    textField1.text = "\(formatTextFieldValue(data: cube.cm))"
                    textField2.text = "\(formatTextFieldValue(data: cube.mm))"
                    textField4.text = "\(formatTextFieldValue(data: cube.km))"
                    textField5.text = "\(formatTextFieldValue(data: cube.metre))"
                }
            case .inputField4:
                if(optionSegementController.selectedSegmentIndex == 0){
                    let liquidUnitObjForFluidOunces = Measurement(value:doubleTextFieldValue, unit: UnitVolume.fluidOunces)
                    liquid.fluidOunce = liquidUnitObjForFluidOunces.value
                    liquid.ukPint = liquidUnitObjForFluidOunces.converted(to: .pints).value
                    liquid.litre = liquidUnitObjForFluidOunces.converted(to: .liters).value
                    liquid.ukGallon = liquidUnitObjForFluidOunces.converted(to: .gallons).value
                    liquid.millilitre = liquidUnitObjForFluidOunces.converted(to: .milliliters).value
                    textField1.text = "\(formatTextFieldValue(data: liquid.ukGallon))"
                    textField2.text = "\(formatTextFieldValue(data: liquid.litre))"
                    textField3.text = "\(formatTextFieldValue(data: liquid.ukPint))"
                    textField5.text = "\(formatTextFieldValue(data: liquid.millilitre))"
                }else {
                    let cubeUnitObjForCubicKilometers = Measurement(value:doubleTextFieldValue, unit: UnitVolume.cubicKilometers)
                    cube.km = cubeUnitObjForCubicKilometers.value
                    cube.mile = cubeUnitObjForCubicKilometers.converted(to: .cubicMiles).value
                    cube.mm = cubeUnitObjForCubicKilometers.converted(to: .cubicMillimeters).value
                    cube.cm = cubeUnitObjForCubicKilometers.converted(to: .cubicCentimeters).value
                    cube.metre = cubeUnitObjForCubicKilometers.converted(to: .cubicMeters).value
                    textField1.text = "\(formatTextFieldValue(data: cube.cm))"
                    textField2.text = "\(formatTextFieldValue(data: cube.mm))"
                    textField3.text = "\(formatTextFieldValue(data: cube.mile))"
                    textField5.text = "\(formatTextFieldValue(data: cube.metre))"
                }
            case .inputField5:
                if(optionSegementController.selectedSegmentIndex == 0){
                    let liquidUnitObjForMilliliters = Measurement(value:doubleTextFieldValue, unit: UnitVolume.milliliters)
                    liquid.millilitre = liquidUnitObjForMilliliters.value
                    liquid.fluidOunce = liquidUnitObjForMilliliters.converted(to: .fluidOunces).value
                    liquid.ukPint = liquidUnitObjForMilliliters.converted(to: .pints).value
                    liquid.litre = liquidUnitObjForMilliliters.converted(to: .liters).value
                    liquid.ukGallon = liquidUnitObjForMilliliters.converted(to: .gallons).value
                    textField1.text = "\(formatTextFieldValue(data: liquid.ukGallon))"
                    textField2.text = "\(formatTextFieldValue(data: liquid.litre))"
                    textField3.text = "\(formatTextFieldValue(data: liquid.ukPint))"
                    textField4.text = "\(formatTextFieldValue(data: liquid.fluidOunce))"
                }else {
                    let cubeUnitObjForCubicMeters = Measurement(value:doubleTextFieldValue, unit: UnitVolume.cubicMeters)
                    cube.metre = cubeUnitObjForCubicMeters.value
                    cube.km = cubeUnitObjForCubicMeters.converted(to: .cubicKilometers).value
                    cube.mile = cubeUnitObjForCubicMeters.converted(to: .cubicMiles).value
                    cube.mm = cubeUnitObjForCubicMeters.converted(to: .cubicMillimeters).value
                    cube.cm = cubeUnitObjForCubicMeters.converted(to: .cubicCentimeters).value
                    textField1.text = "\(formatTextFieldValue(data: cube.cm))"
                    textField2.text = "\(formatTextFieldValue(data: cube.mm))"
                    textField3.text = "\(formatTextFieldValue(data: cube.mile))"
                    textField4.text = "\(formatTextFieldValue(data: cube.km))"
                }
            }
        }
    }
    
    
    @IBAction func saveBtnPressed(_ sender: UIBarButtonItem) {
        
        if(textField1.text != Constants.DEFAULT_TEXT_FIELD_VALUE && textField2.text != Constants.DEFAULT_TEXT_FIELD_VALUE && textField3.text != Constants.DEFAULT_TEXT_FIELD_VALUE && textField4.text != Constants.DEFAULT_TEXT_FIELD_VALUE && textField5.text != Constants.DEFAULT_TEXT_FIELD_VALUE){
            if(optionSegementController.selectedSegmentIndex == 0){
                DataManagementStore.saveDataToStore(key: StoreKeys.Liquid.PRIMARY_KEY, value: creatingHistoryData())
            } else{
                DataManagementStore.saveDataToStore(key: StoreKeys.Cube.PRIMARY_KEY, value: creatingHistoryData())
            }
            showToast(message: Alerts.ValidSaveAttempt.TITLE, seconds: 0.8)
        } else {
            displayAlertView(alertTitle: Alerts.InvalidSaveAttempt.TITLE, alertDescription: Alerts.InvalidSaveAttempt.MESSAGE)
        }
        
    }
    
    @IBAction func historyBtnPressed(_ sender: UIBarButtonItem) {
        var storage:[String] = []
        var storageType:String = ""
        
        if(optionSegementController.selectedSegmentIndex == 0){
             storage = DataManagementStore.getSavedDataFromStore(key: StoreKeys.Liquid.PRIMARY_KEY)
             storageType = StoreKeys.Liquid.PRIMARY_KEY
        } else{
             storage = DataManagementStore.getSavedDataFromStore(key: StoreKeys.Cube.PRIMARY_KEY)
             storageType = StoreKeys.Cube.PRIMARY_KEY
        }
     
        if(storage.count > 0){
            // laoding history page with related history data
            let destination = storyboard?.instantiateViewController(withIdentifier: "historyView") as! HistoryViewController
            destination.storage = storage
            destination.storageType = storageType
            self.present(destination, animated: true, completion: nil)
        }else{
            displayAlertView(alertTitle: Alerts.NoHistory.TITLE, alertDescription: Alerts.NoHistory.MESSAGE)
        }
    }
    
    // creating histroy data
    func creatingHistoryData() -> String{
        
        if(optionSegementController.selectedSegmentIndex == 0){
            return liquid.getLiquidData()
        } else{
            return cube.getCubeData()
        }
        
    }
    
    // saving available data in the text fields when app closing
    func savingDataInAppClose(){
        if(optionSegementController.selectedSegmentIndex == 0){
            defaults.set(textField1.text, forKey: StoreKeys.Liquid.PRESENT_VALUE_UK_GALLON)
            defaults.set(textField2.text, forKey: StoreKeys.Liquid.PRESENT_VALUE_LITER)
            defaults.set(textField3.text, forKey: StoreKeys.Liquid.PRESENT_VALUE_UK_PINT)
            defaults.set(textField4.text, forKey: StoreKeys.Liquid.PRESENT_VALUE_FLUID_OUNCE)
            defaults.set(textField5.text, forKey: StoreKeys.Liquid.PRESENT_VALUE_MILIILITRE)
        }else{
            defaults.set(textField1.text, forKey: StoreKeys.Cube.PRESENT_VALUE_CUBIC_CENTIMETERS)
            defaults.set(textField2.text, forKey: StoreKeys.Cube.PRESENT_VALUE_CUBIC_MILIMETERS)
            defaults.set(textField3.text, forKey: StoreKeys.Cube.PRESENT_VALUE_CUBIC_MILES)
            defaults.set(textField4.text, forKey: StoreKeys.Cube.PRESENT_VALUE_CUBIC_KILOMETERS)
            defaults.set(textField5.text, forKey: StoreKeys.Cube.PRESENT_VALUE_CUBIC_METRES)
        }
        defaults.synchronize()
    }
    
    //  retrieving saved data for text fields when app opening
    func retrievingDataInAppOpen(){
        if(optionSegementController.selectedSegmentIndex == 0){
            textField1.text = defaults.string(forKey: StoreKeys.Liquid.PRESENT_VALUE_UK_GALLON)
            textField2.text = defaults.string(forKey: StoreKeys.Liquid.PRESENT_VALUE_LITER)
            textField3.text = defaults.string(forKey: StoreKeys.Liquid.PRESENT_VALUE_UK_PINT)
            textField4.text = defaults.string(forKey: StoreKeys.Liquid.PRESENT_VALUE_FLUID_OUNCE)
            textField5.text = defaults.string(forKey: StoreKeys.Liquid.PRESENT_VALUE_MILIILITRE)
        } else {
            textField1.text = defaults.string(forKey: StoreKeys.Cube.PRESENT_VALUE_CUBIC_CENTIMETERS)
            textField2.text = defaults.string(forKey: StoreKeys.Cube.PRESENT_VALUE_CUBIC_MILIMETERS)
            textField3.text = defaults.string(forKey: StoreKeys.Cube.PRESENT_VALUE_CUBIC_MILES)
            textField4.text = defaults.string(forKey: StoreKeys.Cube.PRESENT_VALUE_CUBIC_KILOMETERS)
            textField5.text = defaults.string(forKey: StoreKeys.Cube.PRESENT_VALUE_CUBIC_METRES)
        }
        
        
    }
    
    // reseting text fields to default sate
    func resetTextFieldsToDefaultSate(){
        textField1.text = Constants.DEFAULT_TEXT_FIELD_VALUE
        textField2.text = Constants.DEFAULT_TEXT_FIELD_VALUE
        textField3.text = Constants.DEFAULT_TEXT_FIELD_VALUE
        textField4.text = Constants.DEFAULT_TEXT_FIELD_VALUE
        textField5.text = Constants.DEFAULT_TEXT_FIELD_VALUE
    }
    
    // disabling the default keyboard
    func disableDefaultKeyboard(){
        textField1.inputView = UIView()
        textField2.inputView = UIView()
        textField3.inputView = UIView()
        textField4.inputView = UIView()
        textField5.inputView = UIView()
    }
    
    // formatting value into decimal points
    func formatTextFieldValue(data : Double) -> String {
        return String(data.roundToDecimal(defaults.integer(forKey: StoreKeys.DECIMAL_VALUE_KEY)))
    }
    
}
