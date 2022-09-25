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
        TabView {
            Map(coordinateRegion: $airportViewModel.region, showsUserLocation:true, annotationItems: airportViewModel.markers) { mark in
                mark.location
            }.ignoresSafeArea(.all, edges: .top)
            .tabItem {
                Label("Map", systemImage: "mappin.circle.fill")
            }
            ListComponent(airports: airportViewModel.markers)
            .tabItem {
                Label("List", systemImage: "list.bullet.circle.fill")
            }
        }
    }
}

struct MapAirportView_Previews: PreviewProvider {
    static var previews: some View {
        MapAirportView(airportViewModel: .init())
    }
}
