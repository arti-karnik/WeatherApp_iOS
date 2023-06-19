//
//  WeatherViewController.swift
//  weatherApp
//
//  Created by Arti Karnik on 6/17/23.
//  Copyright © 2023 Arti Karnik. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class WeatherViewController: UIViewController {
    
    @IBOutlet weak var weatherdisplayView: weatherDisplayView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var latitude:String = ""
    var longitude: String = ""
    var cityName: String = ""
    var weatherInfo: WeatherInfo?
    var forecastArray: [WeatherForecast] = []
    let locationManager = CLLocationManager()
    var isLocationUpdate: Bool = false
    let defaultCity = "Plano"
    
    override func viewDidLoad() {
        self.searchBar.delegate = self
        collectionView.delegate = self
        collectionView.dataSource = self
        setupUI()
        callLocation()
    }
    
    func setupUI() {
        self.cityName = HelperClass().getSavedCityName()
        self.searchBar.text = self.cityName
    }
}

extension WeatherViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        if searchBar.text != nil {
            self.saveCityNameAndCallApi(_cityName: searchBar.text ?? "")
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
    }
}

// MARK: Network call
extension WeatherViewController {
    func callApi() {
        APIcall().callGeocodeAPIwithCityName(_cityName: cityName,onSuccess: { (result) in
            if result == nil {
                self.isCityNameCorrect(_bool: false)
            }
            guard let lat = result?.lat, let lon = result?.lon else {             self.isCityNameCorrect(_bool: false)
                return
            }
            
            self.latitude = String(lat)
            self.longitude = String(lon)
            self.isCityNameCorrect(_bool: true)
            UserDefaults.standard.set(self.cityName, forKey: "cityName")
            self.callWeatherAPI()
            
        }) { (errorMessage) in
            debugPrint(errorMessage)
            self.isCityNameCorrect(_bool: false)
        }
    }
    
    func callForecastApi() {
        APIcall().callforecastAPIwithLocation(_lat: self.latitude, _lon: self.longitude, onSuccess: { (result) in
            
            for list in result.list {
                let forecast = WeatherForecast(temp: String(list.main.temp), dt: String(list.dt), icon: list.weather[0].icon)
                self.forecastArray.append(forecast)
            }
            self.isCityNameCorrect(_bool: true)
            DispatchQueue.main.async() {
                self.collectionView.reloadData()
            }
            
        }) { (errorMessage) in
            self.isCityNameCorrect(_bool: false)
            debugPrint(errorMessage)
        }
    }
    
    func callWeatherAPI(){
        APIcall().callweatherAPIwithLocation(_lat: self.latitude, _lon: self.longitude, onSuccess: { (result) in
            
            self.weatherInfo = WeatherInfo(cityName: self.cityName, icon: result.weather[0].icon, temp: String(result.main.temp), dt: String(result.dt), wind: String(result.wind.speed), maxTemp: String(result.main.temp_max), minTemp: String(result.main.temp_min), humidity: String(result.main.humidity), description: result.weather[0].description)
            
            self.callForecastApi()
            self.isCityNameCorrect(_bool: true)
            DispatchQueue.main.async() {
                self.weatherdisplayView.setUI(weatherInfo: self.weatherInfo!)
            }
            
        }) { (errorMessage) in
            self.isCityNameCorrect(_bool: false)
            debugPrint(errorMessage)
        }
    }
}

// MARK: Helper method
extension WeatherViewController {
    
    func saveCityNameAndCallApi(_cityName: String) {
        HelperClass().saveCityNameinUserDefault(_str: _cityName)
        self.cityName = _cityName
        self.isLocationUpdate = true
        self.searchBar.text = _cityName
        self.callApi()
    }
    
    func callLocation() {
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }
    
    func isCityNameCorrect(_bool: Bool) {
        if !_bool {
            DispatchQueue.main.async() {
                let alert = UIAlertController(title: "Error", message: "Please check city name and try again!", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
}

//MARK: Location
extension WeatherViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location: CLLocation = manager.location else { return }
        
        self.fetchCityAndCountry(from: location) { city, country, error in
            guard let city = city, let _ = country, error == nil else { return}
            
            if self.cityName == "" || self.isLocationUpdate == false {
                self.saveCityNameAndCallApi(_cityName: city)
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error){
        if self.isLocationUpdate == false {
            self.cityName = defaultCity
            self.callApi()
            self.isLocationUpdate = true
        }
    }
    
    func fetchCityAndCountry(from location: CLLocation, completion: @escaping (_ city: String?, _ country:  String?, _ error: Error?) -> ()) {
        CLGeocoder().reverseGeocodeLocation(location) {
            placemarks, error in completion(placemarks?.first?.locality,
                                            placemarks?.first?.country, error)
        }
    }
}

//MARK: Collection view delegate methods
extension WeatherViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if forecastArray.count > 5 {
            return 5
        }
        return forecastArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RoundCollectionCell", for: indexPath) as! CollectionCellView
        
        cell.configure()
        cell.setUI(forecastInfo: forecastArray[indexPath.row], _row: indexPath.row)
        return cell
    }
}
