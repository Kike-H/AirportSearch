//
//  AirportViewModel.swift
//  AirportSearch
//
//  Created by Kike Hernandez D. on 24/09/22.
//

import Foundation
import SwiftUI
import Alamofire




class AirportViewModel {
    private let baseUrlAPI = "https://aviation-reference-data.p.rapidapi.com/airports/search?"
    private var headers: HTTPHeaders = [:]
    var responses: AirportResponseModel = []
    
    init(){
        @Environment(\.APIKEY) var apiKey
        self.headers["X-RapidAPI-Key"] = apiKey
    }
    
    
    func fetchGetNearAirport(lat: Double, lon: Double, radius: Int, completetion: @escaping (Result<AirportResponseModel, Error>) -> ()) {
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
    
    func makeFecth(lat: Double, lon:Double, radius: Int) {
        self.fetchGetNearAirport(lat:lat, lon: lon, radius: radius) { result in
            switch result {
            case .success(let airports):
                self.responses = airports
            case .failure(let error):
                debugPrint(error)
            }
        }
    }

    
}
