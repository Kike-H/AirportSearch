//
//  AirportResponseModel.swift
//  AirportSearch
//
//  Created by Kike Hernandez D. on 24/09/22.
//

import CoreLocation
import MapKit
import SwiftUI

struct AirportResponseModelElement: Codable {
    let iataCode: String?
    let icaoCode: String?
    let name: String
    let alpha2CountryCode: String
    let latitude, longitude: Double
    
    enum CodingKeys: String, CodingKey {
        case iataCode, icaoCode, name
        case alpha2CountryCode = "alpha2countryCode"
        case latitude, longitude
    }
}


class AirportModelElement: Identifiable {
    let id = UUID()
    let name: String
    let countryCode: String
    let location: MapMarker
    
    init(airportResponse: AirportResponseModelElement) {
        self.name = airportResponse.name
        self.countryCode = airportResponse.alpha2CountryCode
        self.location = .init(coordinate: .init(latitude: airportResponse.latitude, longitude: airportResponse.longitude), tint: .red)
    }
    
}

typealias AirportModel = [AirportModelElement]

typealias AirportResponseModel = [AirportResponseModelElement]
