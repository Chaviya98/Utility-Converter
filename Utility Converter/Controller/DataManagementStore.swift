//
//  DataManagementStore.swift
//  Utility Converter
//
//  Created by Chaveen Ellawela on 2021-02-10.
//

import Foundation


class DataManagementStore: NSObject {
    
    static func saveDataToStore (key:String, value:String) {
        var store :[String] = []
        //Validation check for exsisting key value
        if(UserDefaults.standard.object(forKey: key) != nil) {
            store = UserDefaults.standard.object(forKey: key) as! [String]
            
            //to remove the last entity if the key has 5 data fields
            if(store.count == 5){
                store = Array(store.dropLast())
            }
            store = [value] + store
        }else{
            store.append(value)
        }
        UserDefaults.standard.set(store, forKey: key)
    }
    
    
    static func getSavedDataFromStore(key:String) -> [String] {
        if(UserDefaults.standard.object(forKey: key) != nil){
            return UserDefaults.standard.object(forKey: key) as! [String]
        }else{
            return []
        }
    }
    
}
