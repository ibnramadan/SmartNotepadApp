//
//  NoteDetailsViewController+LocationDelegate.swift
//  SmartNotepadApp
//
//  Created by iMac on 07/06/2021.
//

import Foundation
import CoreLocation
import UIKit
extension NoteDetailsViewController : CLLocationManagerDelegate{
    
     func setupLocation(){
        self.locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            switch locationManager.authorizationStatus {
            case .restricted, .denied:
                showEnableLocationServices()
            case .authorizedAlways, .authorizedWhenInUse, .notDetermined:
                locationManager.delegate = self
                locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
                locationManager.startUpdatingLocation()
            @unknown default:
                break
            }
        }
    }
    
    
    
    private func showEnableLocationServices() {
        let alert = UIAlertController(title: "Allow Location Access", message: "Smart Note Pad needs access to show your location. Turn on Location Services in your device settings.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Settings", style: .default, handler: { (_) in
            guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
                     return
                }
                 if UIApplication.shared.canOpenURL(settingsUrl) {
                     UIApplication.shared.open(settingsUrl, completionHandler: { (success) in })
                  }
        }))
        
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: { (_) in
            self.dismiss(animated: true, completion: nil)
        }))
        
        self.present(alert, animated: false, completion: nil)
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if locations.first != nil {
            CLGeocoder().reverseGeocodeLocation(locations.first ?? CLLocation()) { (placemarks, err) in
                if placemarks?.count ?? 0 > 0 {
                    self.noteLat = locations.first?.coordinate.latitude ?? Double()
                    self.noteLong = locations.first?.coordinate.longitude ?? Double()
                    self.noteAddress = "\(placemarks?[0].locality ?? ""), \(placemarks?[0].country ?? "")"
                    self.locationBtn.setTitle("\(placemarks?[0].locality ?? ""), \(placemarks?[0].country ?? "")", for: .normal)
                }
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
       print("Failed to fetch address")
    }
}
