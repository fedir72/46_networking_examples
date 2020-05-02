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



class ThirdViewController: UIViewController {
    
    let locationManager = CLLocationManager()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        startLocationManager()
    }
    
    
    
    func startLocationManager() {
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = 1000
            locationManager.pausesLocationUpdatesAutomatically = false
            locationManager.startUpdatingLocation()
            
        }
        
    }
  

}

extension ThirdViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let lastlocation = locations.last {
            print(lastlocation.coordinate.latitude , lastlocation.coordinate.longitude)
        }
    }
}
