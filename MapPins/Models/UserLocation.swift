//
//  UserLocation.swift
//  MapPins
//
//  Created by Majid on 30/03/2023.
//

import SwiftUI
import MapKit

enum UserAccess {
    case everyOne, mutuals, friends, none
}

struct UserLocation: Identifiable {
    var id = UUID()
    var name: String
    var coordinate: CLLocationCoordinate2D
    var image: Image?
    var tint: Color?
    var access: UserAccess = .friends
}
