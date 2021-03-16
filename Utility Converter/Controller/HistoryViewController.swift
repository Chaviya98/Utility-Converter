//
//  HistoryViewController.swift
//  Utility Converter
//
//  Created by Chaveen Ellawela on 2021-02-13.
//

import Foundation
import UIKit


enum HistoryViews: Int {
    case weight, length, temperature , liquid , cube , speed
}

class HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    // History values store
    var storage:[String] = []
    var storageType:String = ""
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var historyViewSegementController: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSegementControllerValue()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return storage.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! HistoryTableCell
        cell.cellImage.image = UIImage(named: extractCellImageName())
        cell.cellDetails.text = storage[indexPath.row]
        cell.isUserInteractionEnabled = false
        cell.contentView.layer.masksToBounds = false
        cell.cellImage.layer.cornerRadius = 20
        cell.cellImage.clipsToBounds = true
        return cell
    }
    
    
    @IBAction func historyViewSegementControllerValueChanged(_ sender: UISegmentedControl) {
        
        switch HistoryViews(rawValue: sender.selectedSegmentIndex)! {

        case .weight:
            storage = extractStoreData(key: StoreKeys.Weight.PRIMARY_KEY)
            storageType = StoreKeys.Weight.PRIMARY_KEY
        case .length:
            storage = extractStoreData(key: StoreKeys.Length.PRIMARY_KEY)
            storageType = StoreKeys.Length.PRIMARY_KEY
        case .temperature:
            storage = extractStoreData(key: StoreKeys.Temperature.PRIMARY_KEY)
            storageType = StoreKeys.Temperature.PRIMARY_KEY
        case .liquid:
            storage = extractStoreData(key: StoreKeys.Liquid.PRIMARY_KEY)
            storageType = StoreKeys.Liquid.PRIMARY_KEY
        case .cube:
            storage = extractStoreData(key: StoreKeys.Cube.PRIMARY_KEY)
            storageType = StoreKeys.Cube.PRIMARY_KEY
        case .speed:
            storage = extractStoreData(key: StoreKeys.Speed.PRIMARY_KEY)
            storageType = StoreKeys.Speed.PRIMARY_KEY
        }
        self.tableView.reloadData()
    }
    
    
    func extractStoreData(key:String) -> [String]{
       let tempStorage = DataManagementStore.getSavedDataFromStore(key: key)
        if (tempStorage.isEmpty){
            return [Alerts.NoHistory.MESSAGE]
        } else {
            return tempStorage
        }
    }
    
    func extractCellImageName() -> String {
        if(storageType == StoreKeys.Temperature.PRIMARY_KEY){
            return "TemperatureHome"
        } else if (storageType == StoreKeys.Speed.PRIMARY_KEY) {
            return "SpeedHome"
        } else if (storageType == StoreKeys.Length.PRIMARY_KEY){
            return "LengthHome"
        } else if (storageType == StoreKeys.Weight.PRIMARY_KEY) {
            return "WeightHome"
        } else if (storageType == StoreKeys.Liquid.PRIMARY_KEY) {
            return "VolumeHome"
        } else if (storageType == StoreKeys.Cube.PRIMARY_KEY) {
            return "CubeHome"
        } else {
            return ""
        }
    }
    
    
    private func setSegementControllerValue(){
        if(storageType == StoreKeys.Weight.PRIMARY_KEY){
            historyViewSegementController.selectedSegmentIndex = 0
        } else if (storageType == StoreKeys.Length.PRIMARY_KEY) {
            historyViewSegementController.selectedSegmentIndex = 1
        } else if (storageType == StoreKeys.Temperature.PRIMARY_KEY){
            historyViewSegementController.selectedSegmentIndex = 2
        } else if (storageType == StoreKeys.Liquid.PRIMARY_KEY) {
            historyViewSegementController.selectedSegmentIndex = 3
        } else if (storageType == StoreKeys.Cube.PRIMARY_KEY) {
            historyViewSegementController.selectedSegmentIndex = 4
        } else if (storageType == StoreKeys.Speed.PRIMARY_KEY) {
            historyViewSegementController.selectedSegmentIndex = 5
        }
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func clearBtnPressed(_ sender: UIBarButtonItem) {
        DataManagementStore.clearHistoryData(key: storageType)
        storage = [Alerts.NoHistory.MESSAGE]
        self.tableView.reloadData()
    }
    
}
