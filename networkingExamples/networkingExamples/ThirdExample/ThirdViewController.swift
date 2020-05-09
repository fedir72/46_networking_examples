//
//  ThirdViewController.swift
//  networkingExamples
//
//  Created by fedir on 26.04.2020.
//  Copyright © 2020 fedir. All rights reserved.
//

import UIKit
import CoreLocation

//получение данных о погоде по координатам

//eb7a15d8fd1a0483259f928009d91932

//var stringUrl = "api.openweathermap.org/data/2.5/weather?lat=\()&lon=\()&appid=eb7a15d8fd1a0483259f928009d91932"
//let urlName = "http://api.openweathermap.org/data/2.5/weather?q=Kharkiv&APPID=eb7a15d8fd1a0483259f928009d91932"

class ThirdViewController: UIViewController {
    
    var temperature: Int?
    var descript:String?
    var country: String?
    var imageName:String?
    var id:Int?
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var GoSearchButton: UIButton!
    
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var weatherDescriptionLabel: UILabel!
    @IBOutlet weak var temperaturelabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var weatherImageView: UIImageView!
    
    let locationManager = CLLocationManager()
    var weatherData = WeatherData()
  
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
    }
    
    @IBAction func goToSearchButton(_ sender: UIButton) {
        updateWeatherInfo(cityName: searchTextField.text ?? "Kharkiv")
        searchTextField.text = ""
    }
    
    
  
    
    func updateView() {
        
   
        
    }
    
    func updateWeatherInfo(cityName: String) {
        
        let session = URLSession.shared
        let urlName = "http://api.openweathermap.org/data/2.5/weather?q=\(cityName .replacingOccurrences(of: " ", with:"%20"))&APPID=eb7a15d8fd1a0483259f928009d91932"
         //let coordinateURL =   "http://api.openweathermap.org/data/2.5/weather?lat={50.0}&lon={36.15}&appid={bce1e689d3e7499371dd62da5b22794a}"
        if let url = URL(string:urlName) {
            
           URLSession.shared.dataTask(with: url) {(data, responce, error) in
            guard error == nil else {
                print("Datatask error: ",error!.localizedDescription)
                return
            }
            do {
               let item = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String:AnyObject]
                           print("item is: ",item)
                if let weather = item["weather"] {
                    self.id = weather["id"] as? Int
                    self.descript = weather["description"] as? String
                    self.imageName = weather["icon"] as? String
                }
                
                
                DispatchQueue.main.async {
                    self.weatherDescriptionLabel.text = self.descript
                    self.weatherImageView.image = UIImage(named: self.imageName ?? "01d")
                }
                
            }catch{
                print("print",error.localizedDescription)
            }
             
        }
        .resume()
        
        }
}
  

}


