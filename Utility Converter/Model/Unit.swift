//
//  Unit.swift
//  Utility Converter
//
//  Created by Chaveen Ellawela on 2021-03-06.
//

import Foundation

class Unit {
    let defaults = UserDefaults.standard
    
    // formatting value into 2 decimal points
    func formatTextFieldValue(data : Double) -> String {
        return String(data.roundToDecimal(defaults.integer(forKey: StoreKeys.DECIMAL_VALUE_KEY)))
    }
}
