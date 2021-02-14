//
//  HistoryViewController.swift
//  Utility Converter
//
//  Created by Chaveen Ellawela on 2021-02-13.
//

import Foundation
import UIKit

class HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    // History values store
    var storage:[String] = []
    var storageType:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    
    func extractCellImageName() -> String {
        if(storageType == "temperature"){
            return "TemperatureHome"
        } else if (storageType == "speed") {
            return "SpeedHome"
        } else if (storageType == "length"){
            return "LengthHome"
        } else if (storageType == "weight") {
            return "WeightHome"
        } else {
            return "VolumeHome"
        }
    }
    
    @IBAction func BackBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
