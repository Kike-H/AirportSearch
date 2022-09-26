//
//  MapAirportView.swift
//  AirportSearch
//
//  Created by Kike Hernandez D. on 24/09/22.
//

import SwiftUI
import MapKit


/* MARK: - Comment
 
 This is the second view this view switches between a view map and list, both show the pins that have gotten of the first view
 
*/

struct MapAirportView: View {
    @State var region: MKCoordinateRegion
    var airports: AirportModel
    var body: some View {
        TabView {
            Map(coordinateRegion: $region, showsUserLocation:true, annotationItems: airports) { mark in
                mark.location
            }.ignoresSafeArea([.all], edges: [.top, .horizontal])
            .tabItem {
                Label("Map", systemImage: "mappin.circle.fill")
            }
            ListComponent(airports: airports)
                .badge(airports.count)
            .tabItem {
                Label("List", systemImage: "list.bullet.circle.fill")
            }
        }
    }
}

struct MapAirportView_Previews: PreviewProvider {
    static var previews: some View {
        MapAirportView(region: .init(), airports: .init())
    }
}
