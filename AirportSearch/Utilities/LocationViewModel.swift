//
//  LocationManager.swift
//  AirportSearch
//
//  Created by Kike Hernandez D. on 24/09/22.
//

import Foundation
import CoreLocation
import CoreLocationUI
import MapKit


class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    var manager: CLLocationManager?
    var lat: Double = 37.785834
    var lon: Double = -122.406417
    var airportViewModel: AirportViewModel = AirportViewModel()
    var markers: AirportModel = AirportModel()
    
    
    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude:37.785834 , longitude:  -122.406417), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    
    
    func checkIfLocationServicvesIsEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            manager = CLLocationManager()
            manager!.delegate = self
        }
        debugPrint("No services location available")
    }
    
    private func checkLocationAuthorization() {
        guard let manager = manager else { return }
        
        switch manager.authorizationStatus {
        case .notDetermined:
            manager.requestWhenInUseAuthorization()
        case .restricted:
            debugPrint("Restricted")
        case .denied:
            debugPrint("Deny")
        case .authorizedWhenInUse, .authorizedAlways:
            self.lat = manager.location!.coordinate.latitude
            self.lon = manager.location!.coordinate.longitude
            region = MKCoordinateRegion(center: manager.location!.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
            break
        @unknown default:
            break
        }

    }
    
    func setMarkers(radius: Int) {
        airportViewModel.makeFecth(lat: lat, lon:lon, radius: radius)
        markers = []
        for m in airportViewModel.responses {
            markers.append(.init(airportResponse: m))
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
    
}
