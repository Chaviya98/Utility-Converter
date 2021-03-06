//
//  Liquid.swift
//  Utility Converter
//
//  Created by Chaveen Ellawela on 2021-02-16.
//

import Foundation

class Liquid : Unit{
    var ukGallon: Double
    var litre: Double
    var ukPint: Double
    var fluidOunce: Double
    var millilitre: Double
    
    override init() {
        self.ukGallon = 0.0
        self.litre = 0.0
        self.ukPint = 0.0
        self.fluidOunce = 0.0
        self.millilitre = 0.0
    }
    
    init(ukGallon: Double, litre:Double, ukPint:Double, fluidOunce:Double,millilitre:Double ) {
        self.ukGallon = ukGallon
        self.litre = litre
        self.ukPint = ukPint
        self.fluidOunce = fluidOunce
        self.millilitre = millilitre
    }
    
    // creating histroy data
    func getLiquidData() -> String {
        return "Liquid-UK Gallon --> \(formatTextFieldValue(data: self.ukGallon))\n" +
            "Liquid-Liter --> \(formatTextFieldValue(data: self.litre))\n" +
            "Liquid-Uk Pint --> \(formatTextFieldValue(data: self.ukPint))\n" +
            "Liquid-Fluid Ounce --> \(formatTextFieldValue(data: self.fluidOunce))\n" +
            "Liquid-Mililitre --> \(formatTextFieldValue(data: self.millilitre))"
    }
}
