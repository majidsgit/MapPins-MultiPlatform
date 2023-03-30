//
//  MapsView.swift
//  MapPins
//
//  Created by Majid on 30/03/2023.
//

import SwiftUI
import MapKit

struct MapsView: View {
    
    @ObservedObject private var locationManager = LocationManager()
    
    var body: some View {
        Map(coordinateRegion: $locationManager.region, showsUserLocation: false, annotationItems: $locationManager.annotations) { item in
            
            MapAnnotation(coordinate: item.coordinate.wrappedValue) {
                ZStack(alignment: .top) {
                    Image("pin")
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(item.tint.wrappedValue ?? .blue)
                        .frame(width: 50, height: 50)
                    if let image = item.image.wrappedValue {
                        image
                            .resizable()
                            .frame(width: 30, height: 30)
                            .cornerRadius(15)
                            .padding(.top, 3.5)
                    }
                }
            }
            
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
    }
}
