//
//  MapAirportView.swift
//  AirportSearch
//
//  Created by Kike Hernandez D. on 24/09/22.
//

import SwiftUI
import MapKit

struct MapAirportView: View {
    @StateObject var airportViewModel: LocationManager
    var body: some View {
        Map(coordinateRegion: $airportViewModel.region,  showsUserLocation: true, annotationItems: airportViewModel.markers) { mark in
            mark.location
        }
    }
}

struct MapAirportView_Previews: PreviewProvider {
    static var previews: some View {
        MapAirportView(airportViewModel: .init())
    }
}
