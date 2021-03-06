//
//  Weight.swift
//  Utility Converter
//
//  Created by Chaveen Ellawela on 2021-02-14.
//

import Foundation

class Weight :Unit {
    var kg: Double
    var grams: Double
    var ounces: Double
    var pounds: Double
    var stonepounds: Double

    override init() {
        self.kg = 0.0
        self.grams = 0.0
        self.ounces = 0.0
        self.pounds = 0.0
        self.stonepounds = 0.0
    }
    
    init(kg: Double, grams: Double, ounces: Double, pounds: Double, stonepounds: Double) {
        self.kg = kg
        self.grams = grams
        self.ounces = ounces
        self.pounds = pounds
        self.stonepounds = stonepounds
    }
    
    // creating histroy data
    func getWeightData() -> String {
        return "\(NSLocalizedString("WeightHistoryTitleForKG", comment: ""))\(formatTextFieldValue(data: self.kg)))\n" +
            "\(NSLocalizedString("WeightHistoryTitleForGrams", comment: ""))\(formatTextFieldValue(data: self.grams))\n" +
            "\(NSLocalizedString("WeightHistoryTitleForOunces", comment: ""))\(formatTextFieldValue(data: self.ounces))" +
            "\(NSLocalizedString("WeightHistoryTitleForPounds", comment: ""))\(formatTextFieldValue(data: self.pounds))\n" +
            "\(NSLocalizedString("WeightHistoryTitleForStonePounds", comment: ""))\(formatTextFieldValue(data: self.stonepounds))"
    }
    
}
