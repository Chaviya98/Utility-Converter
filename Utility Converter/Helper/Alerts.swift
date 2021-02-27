//
//  Alerts.swift
//  Utility Converter
//
//  Created by Chaveen Ellawela on 2021-02-27.
//

import Foundation

struct Alerts {

    struct CommonAlert {
        static let TITLE = "Something went wrong !"
        static let MESSAGE = "Please try again later."
        static let ACTION_TITLE = "OK"
    }
    
    struct InvalidParameters {
        static let TITLE = "Converting Failed !"
        static let MESSAGE = "Please enter a digit value as the input."
    }
    
    struct NoHistory {
        static let TITLE = "No History !"
        static let MESSAGE = "No saved history found. Plase click save to add calculations to history."
    }
    
    struct InvalidSaveAttempt {
        static let TITLE = "Save Failed !"
        static let MESSAGE = "Please check the text fields and try again."
    }
    
    struct ValidSaveAttempt {
        static let TITLE = "Succssfully Saved !"
        static let MESSAGE = ""
    }
    
    struct InvalidDecimalRoundUpNumber {
        static let TITLE = "Save Failed !"
        static let MESSAGE = "Please enter a different digit value. The maximum value you can enter is 5."
    }
    
    
}
