//
//  CellComponent.swift
//  AirportSearch
//
//  Created by Kike Hernandez D. on 25/09/22.
//

import SwiftUI

struct CellComponent: View {
    
    let airportName: String
    let countryCode: String
    let lat: Double
    let lon: Double
    
    private let limit = 1
    
    var body: some View {
        HStack {
            Image(systemName: "airplane.circle.fill")
                .font(.system(size: 25))
                .foregroundColor(.blue)
            VStack {
                Text("\(airportName)")
                    .lineLimit(limit)
                Text("\(countryCode)")
                    .lineLimit(limit)
            }.frame(width: 90)
            Spacer()
            Image(systemName: "mappin").font(.system(size: 20))
                .foregroundColor(.red)
                .frame(width: 60)
            VStack {
                Text("Lat: \(lat)")
                    .lineLimit(limit)
                Text("Lon: \(lon)")
                    .lineLimit(limit)
            }
            Spacer()
        }
    }
}

struct CellComponent_Previews: PreviewProvider {
    static var previews: some View {
        CellComponent(airportName: "Airportt Mexicooooooooooooooooo", countryCode: "Mx", lat: 90.0000000, lon: 110)
    }
}
