//
//  AirportResponseModel.swift
//  AirportSearch
//
//  Created by Kike Hernandez D. on 24/09/22.
//

import Foundation

struct AirportResponseModelElement: Codable {
    let iataCode, icaoCode, name, alpha2CountryCode: String
    let latitude, longitude: Double
    
    enum CodingKeys: String, CodingKey {
        case iataCode, icaoCode, name
        case alpha2CountryCode = "alpha2countryCode"
        case latitude, longitude
    }
}

typealias AirportResponseModel = [AirportResponseModelElement]

