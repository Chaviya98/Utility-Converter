//
//  Liquid.swift
//  Utility Converter
//
//  Created by Chaveen Ellawela on 2021-02-16.
//

import Foundation

class Liquid {
    var ukGallon: Double
    var litre: Double
    var ukPint: Double
    var fluidOunce: Double
    var millilitre: Double
    
    init(ukGallon: Double, litre:Double, ukPint:Double, fluidOunce:Double,millilitre:Double ) {
        self.ukGallon = ukGallon
        self.litre = litre
        self.ukPint = ukPint
        self.fluidOunce = fluidOunce
        self.millilitre = millilitre
    }
}
