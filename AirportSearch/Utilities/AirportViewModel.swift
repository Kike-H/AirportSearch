//
//  AirportViewModel.swift
//  AirportSearch
//
//  Created by Kike Hernandez D. on 24/09/22.
//

import Foundation
import SwiftUI
import Alamofire




class AirportViewModel: ObservableObject{
    private let baseUrlAPI = "https://aviation-reference-data.p.rapidapi.com/airports/search?"
    private var headers: HTTPHeaders = [:]
    @Published var airportsResponse: AirportModel = []
    
    init(){
        @Environment(\.APIKEY) var apiKey
        self.headers["X-RapidAPI-Key"] = apiKey
    }
    
    
    private func fetchGetNearAirport(lat: Double, lon: Double, radius: Int, completetion: @escaping (Result<AirportResponseModel, Error>) -> ()) {
        AF.request(baseUrlAPI+"lat=\(lat)&lon=\(lon)&radius=\(radius)", headers: self.headers)
            .responseDecodable(of: AirportResponseModel.self) { response in
                guard let airports = response.value else {
                    if let error = response.error {
                        completetion(.failure(error))
                    }
                    return
                }
                completetion(.success(airports))
            }
    }
    
    func setAirPorts(lat: Double, lon:Double, radius: Int) {
        self.fetchGetNearAirport(lat:lat, lon: lon, radius: radius) { result in
            switch result {
            case .success(let airports):
                self.airportsResponse = airports.map {.init(airportResponse: $0)}
            case .failure(let error):
                debugPrint(error)
            }
        }
    }

    
}
