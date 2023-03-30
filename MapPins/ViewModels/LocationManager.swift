//
//  LocationManager.swift
//  MapPins
//
//  Created by Majid on 30/03/2023.
//

import SwiftUI
import MapKit

class LocationManager: NSObject, ObservableObject {
    
    @Published var rect = MKMapRect()
    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10))
    @Published var userLocation = CLLocation()
    @Published var annotations = [UserLocation]()
    private var locationManager = CLLocationManager()
    
    override init() {
        super.init()
        self.locationManager.delegate = self
        self.authorizeLocationAccess()
    }
    
    func authorizeLocationAccess() {
        locationManager.requestAlwaysAuthorization()
    }
    
    func getAllUsersLocations() {
        
    }
}

extension LocationManager: CLLocationManagerDelegate {
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        #if os(macOS)
        if  manager.authorizationStatus == .authorizedAlways {
            if let userLocation = manager.location {
                region = MKCoordinateRegion(center: userLocation.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
                let image = Image("2")
                let user = UserLocation(name: "Majid", coordinate: userLocation.coordinate, image: image, tint: .red)
                annotations.append(user)
            }
        }
        #endif
        #if os(iOS)
        if  manager.authorizationStatus == .authorizedAlways ||
                manager.authorizationStatus == .authorizedWhenInUse {
            if let userLocation = manager.location {
                region = MKCoordinateRegion(center: userLocation.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
                let image = Image("2")
                let user = UserLocation(name: "Majid", coordinate: userLocation.coordinate, image: image, tint: .red)
                annotations.append(user)
            }
        }
        #endif
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        print(newHeading.timestamp)
    }
}
