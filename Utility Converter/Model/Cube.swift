//
//  Cube.swift
//  Utility Converter
//
//  Created by Chaveen Ellawela on 2021-02-17.
//

import Foundation
class Cube : Unit {
    var cm: Double
    var mm: Double
    var mile: Double
    var km: Double
    var metre: Double
    
  override init() {
        self.cm = 0.0
        self.mm = 0.0
        self.mile = 0.0
        self.km = 0.0
        self.metre = 0.0
    }

    init(cm: Double, mm: Double, mile: Double, km: Double, metre: Double) {
        self.cm = cm
        self.mm = mm
        self.mile = mile
        self.km = km
        self.metre = metre
        
    }
    // creating histroy data
    func getCubeData() -> String {
        return "\(NSLocalizedString("CubeHistoryTitleForCubicCentimeters", comment: ""))\(formatTextFieldValue(data: self.cm))\n" +
            "\(NSLocalizedString("CubeHistoryTitleForCubicMillimeters", comment: ""))\(formatTextFieldValue(data: self.mm))\n" +
            "\(NSLocalizedString("CubeHistoryTitleForCubicMiles", comment: ""))\(formatTextFieldValue(data: self.mile))\n" +
            "\(NSLocalizedString("CubeHistoryTitleForCubicKilometers", comment: ""))\(formatTextFieldValue(data: self.km))\n" +
            "\(NSLocalizedString("CubeHistoryTitleForCubicMeters", comment: ""))\(formatTextFieldValue(data: self.metre))"
    }
}
