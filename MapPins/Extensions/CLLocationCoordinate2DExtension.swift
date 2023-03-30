//
//  CLLocationCoordinate2DExtension.swift
//  MapPins
//
//  Created by Majid on 30/03/2023.
//

import MapKit

extension CLLocationCoordinate2D: Identifiable {
    public var id: String {
        "\(latitude)-\(longitude)"
    }
}
