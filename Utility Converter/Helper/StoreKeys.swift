//
//  StoreKeys.swift
//  Utility Converter
//
//  Created by Chaveen Ellawela on 2021-02-27.
//

import Foundation

struct StoreKeys {
    
    static let DECIMAL_VALUE_KEY = "roundup_decimalnumber"
    static let SEGEMENT_CONTROLLER_KEY_VOLUME = "volume_option"
    
    struct Weight {
        static let PRIMARY_KEY = "weight"
        static let PRESENT_VALUE_KILOGRAMS = "weight_kg"
        static let PRESENT_VALUE_GRAMS = "weight_grams"
        static let PRESENT_VALUE_OUNCE = "weight_ounce"
        static let PRESENT_VALUE_POUND = "weight_pound"
        static let PRESENT_VALUE_STONE = "weight_stone"
        static let PRESENT_VALUE_STONEPOUNDS = "weight_stonepounds"
    }
    
    struct Length {
        static let PRIMARY_KEY = "length"
        static let PRESENT_VALUE_CENTIMETER = "length_centimeter"
        static let PRESENT_VALUE_MILLIMETER = "length_millimeter"
        static let PRESENT_VALUE_MILE = "length_mile"
        static let PRESENT_VALUE_KILOMETER = "length_kilometer"
        static let PRESENT_VALUE_METRE = "length_metre"
        static let PRESENT_VALUE_YARD = "length_yard"
        static let PRESENT_VALUE_INCH = "length_inch"
    }
    
    
    struct Speed {
        static let PRIMARY_KEY = "speed"
        static let PRESENT_VALUE_METRE_PER_SEC = "speed_metrespersec"
        static let PRESENT_VALUE_KILOMETERS_PER_HOUR = "speed_kmperhour"
        static let PRESENT_VALUE_MILES_PER_HOUR = "speed_milesperhour"
        static let PRESENT_VALUE_KNOTS_PER_HOUR = "speed_knotsperhour"
    }

    struct Temperature {
        static let PRIMARY_KEY = "temperature"
        static let PRESENT_VALUE_FAHRENHEIT = "temperature_fahrenheit"
        static let PRESENT_VALUE_CELSIUS = "temperature_celsius"
        static let PRESENT_VALUE_KELVIN = "temperature_kelvin"
    }

    struct Volume {
        static let PRIMARY_KEY = "volume"
        static let PRESENT_VALUE_UK_GALLON = "liquid_ukgallon"
        static let PRESENT_VALUE_LITER = "liquid_liter"
        static let PRESENT_VALUE_UK_PINT = "liquid_ukpint"
        static let PRESENT_VALUE_FLUID_OUNCE = "liquid_fluidounce"
        static let PRESENT_VALUE_MILIILITRE = "liquid_mililitre"
        
        static let PRESENT_VALUE_CUBIC_CENTIMETERS = "cube_centimeters"
        static let PRESENT_VALUE_CUBIC_MILIMETERS = "cube_milimeters"
        static let PRESENT_VALUE_CUBIC_MILES = "cube_miles"
        static let PRESENT_VALUE_CUBIC_KILOMETERS = "cube_kilometers"
        static let PRESENT_VALUE_CUBIC_METRES = "cube_metre"
    }
}
