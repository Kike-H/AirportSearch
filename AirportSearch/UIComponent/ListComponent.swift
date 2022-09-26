//
//  ListComponent.swift
//  AirportSearch
//
//  Created by Kike Hernandez D. on 25/09/22.
//

import SwiftUI

/* MARK: - Comment
 
 If the list of airports is empty the view shows a empty message else show a list of all the elements of aiports in base a cellComponent
 
*/


struct ListComponent: View {
    var airports: AirportModel
    
    var body: some View {
        if(airports.isEmpty) {
            HStack {
                Text("NO AIRPORTS FOUND")
                    .font(.title)
                    .foregroundColor(.gray)
                Image(systemName: "exclamationmark.triangle.fill")
                    .font(.title)
                    .foregroundColor(.gray)
            }
        }
        else {
            List (airports) { airport in
                CellComponent(airportName: airport.name, countryCode: airport.countryCode, lat: airport.lat, lon: airport.lon)
            }
        }
    }
}

struct ListComponent_Previews: PreviewProvider {
    static var previews: some View {
        ListComponent(airports: .init())
    }
}
