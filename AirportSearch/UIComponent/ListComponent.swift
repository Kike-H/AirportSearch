//
//  ListComponent.swift
//  AirportSearch
//
//  Created by Kike Hernandez D. on 25/09/22.
//

import SwiftUI

struct ListComponent: View {
    var airports: AirportModel
    
    var body: some View {
        List (airports) { airport in
            CellComponent(airportName: airport.name, countryCode: airport.countryCode, lat: airport.lat, lon: airport.lon)
        }
    }
}

struct ListComponent_Previews: PreviewProvider {
    static var previews: some View {
        ListComponent(airports: .init())
    }
}
