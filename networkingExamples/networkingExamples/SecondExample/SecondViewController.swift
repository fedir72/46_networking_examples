//
//  SecondViewController.swift
//  networkingExamples
//
//  Created by fedir on 26.04.2020.
//  Copyright © 2020 fedir. All rights reserved.
//

import UIKit
import MapKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tempCelsiuslabel: UILabel!
    @IBOutlet weak var localTimeLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    
    @IBOutlet weak var weaterIconLabel: UIImageView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var mapView: MKMapView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchBar.delegate = self
        mapView.delegate = self
        
    }
    


}

extension SecondViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        print("SearchbarText: ",searchBar.text!)
        
        var locationName: String?
        var temperatureCelsius: Int?
        var countryname: String?
        var timeLocal: String?
        var errorHasOccured = false
        //var imageWeather: String?
        
        
        let strUrl = "http://api.weatherstack.com/current?access_key=bce1e689d3e7499371dd62da5b22794a&query=\(searchBar.text! .replacingOccurrences(of: " ", with:"%20"))"
      
        let url = URL(string: strUrl)
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            do {
            let json = try  JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String:AnyObject]
               print(json)
                
                //MARK: - срабатывает при ошибке
                if let _ = json["error"] {
                    errorHasOccured = true
                }
                
                if let location = json["location"] {
                 
                    locationName = location["name"] as? String
                    countryname = location["country"] as? String
                    timeLocal = location["localtime"] as? String
                    
                    //print(locationName)
                }
                
                if let current = json["current"] {
                    temperatureCelsius = current["temperature"] as? Int
                }
                
                DispatchQueue.main.async {
                    
                    if errorHasOccured {
                        //MARK: - сработает если значениe не найдено
                        self.nameLabel.text = "Локация не найдена"
                        self.searchBar.text = ""
                    } else {
                self.nameLabel.text = "City: " + (locationName!)
                self.tempCelsiuslabel.text = "Temperature ℃: \(temperatureCelsius!)"
                self.countryLabel.text = countryname!
                self.localTimeLabel.text = "LocalTime: " + (timeLocal! )
                self.searchBar.text = ""
                    }
                    
                }
            }catch{
                print(error)
            }
            
            
        }
        
        task.resume()
    }
    
}


extension SecondViewController: MKMapViewDelegate {
    
    
    
    }
