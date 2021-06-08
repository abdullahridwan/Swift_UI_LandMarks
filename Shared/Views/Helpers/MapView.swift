//
//  MapView.swift
//  SwiftUI Tutorial
//
//  Created by Abdullah Ridwan on 5/20/21.
//

import SwiftUI
import MapKit

struct MapView: View {
    var coordinate: CLLocationCoordinate2D
    
    //initial setup
    @State private var region = MKCoordinateRegion(
        center:CLLocationCoordinate2D(latitude: 40.785091, longitude: -73.968285),
        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
    )
    
    //when map appears update region
    var body: some View {
        Map(coordinateRegion: $region)
            .onAppear(perform: {
                setRegion(coordinate)
            })
    }
    
    //takes in coordinate and updates the map view
    private func setRegion(_ coordinate: CLLocationCoordinate2D){
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }
    
    
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
    }
}