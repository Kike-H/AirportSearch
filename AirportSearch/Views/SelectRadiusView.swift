//
//  SelectRadiusView.swift
//  AirportSearch
//
//  Created by Kike Hernandez D. on 24/09/22.
//

import SwiftUI

/* MARK: - Comment
 
 This is the main view the show a slider for select the radius
 
*/

struct SelectRadiusView: View {
    @State private var sliderValue: Double = 10
    @StateObject var locationViewModel: LocationViewModel = .init() // Control location
    @StateObject var airportViewModel: AirportViewModel = .init() // Control Api
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Image("Logo")
                    .padding(.bottom, 40)
                Text("\(Int(sliderValue))")
                    .font(.system(size: 60, weight: .bold))
                    .foregroundColor(.gray)
                Slider(value: $sliderValue, in: 10...200, step: 5.0)
                Text("RADIUS IN KM")
                    .font(.title2)
                    .foregroundColor(.gray)
                Spacer()
//              This Button redirects you to the map view (with user's region and airports)
                NavigationLink(destination: MapAirportView(region: locationViewModel.region, airports: airportViewModel.airportsResponse)) {
                    Text("SEARCH")
                        .font(.title)
                        .bold()
                        .frame(width: 285, height: 75)
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .padding()
                }
                Spacer()
            }.simultaneousGesture(TapGesture().onEnded {
//              Whit the same tap gesture make a fecth to api
                airportViewModel.setAirPorts(lat: locationViewModel.lat, lon: locationViewModel.lon, radius: Int(sliderValue))
            })
            .padding()
        }
    }
}

struct SelectRadiusView_Previews: PreviewProvider {
    static var previews: some View {
        SelectRadiusView()
    }
}
