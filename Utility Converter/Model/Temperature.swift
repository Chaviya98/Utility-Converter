//
//  Temperature.swift
//  Utility Converter
//
//  Created by Chaveen Ellawela on 2021-02-13.
//

import Foundation

class Temperature: Unit {
    var farenheit : Double
    var celsius : Double
    var kelvin : Double
    
    override init() {
        self.farenheit = 0.0
        self.celsius = 0.0
        self.kelvin = 0.0
    }
    
    init(farenheit: Double, celsius: Double,  kelvin: Double) {
        self.farenheit = farenheit
        self.celsius = celsius
        self.kelvin = kelvin
    }
    
    // creating histroy data
    func getTemperatureData() -> String {
        return "\(NSLocalizedString("TemperatureHistoryTitleForFahrenheit", comment: ""))\(formatTextFieldValue(data: self.farenheit))\n" +
            "\(NSLocalizedString("TemperatureHistoryTitleForCelsius", comment: ""))\(formatTextFieldValue(data: self.celsius))\n" +
            "\(NSLocalizedString("TemperatureHistoryTitleForKelvin", comment: ""))\(formatTextFieldValue(data: self.kelvin))"
    }
}
