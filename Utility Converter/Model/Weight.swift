//
//  Weight.swift
//  Utility Converter
//
//  Created by Chaveen Ellawela on 2021-02-14.
//

import Foundation

class Weight {
    var kg: Double
    var grams: Double
    var ounces: Double
    var pounds: Double
    var stonepounds: Double

    init(kg: Double, grams: Double, ounces: Double, pounds: Double, stonepounds: Double) {
        self.kg = kg
        self.grams = grams
        self.ounces = ounces
        self.pounds = pounds
        self.stonepounds = stonepounds
    }
    
}
