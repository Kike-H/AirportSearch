//
//  SelectRadiusView.swift
//  AirportSearch
//
//  Created by Kike Hernandez D. on 24/09/22.
//

import SwiftUI

struct SelectRadiusView: View {
    @State private var sliderValue: Double = 10
    @StateObject var airportViewModel: LocationManager = LocationManager()
    
    var body: some View {
        NavigationView {
            VStack {
                Text("\(Int(sliderValue))")
                Slider(value: $sliderValue, in: 10...100, step: 5.0) { _ in
                    airportViewModel.setMarkers(radius: Int(sliderValue))
                }
                NavigationLink(destination: MapAirportView(airportViewModel: airportViewModel)) {
                    Text("Search")
                        .font(.title)
                        .bold()
                        .frame(width: 285, height: 75)
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .padding()
                }
                .onAppear {
                    airportViewModel.checkIfLocationServicvesIsEnabled()
                }
            }.simultaneousGesture(TapGesture().onEnded {
                airportViewModel.setMarkers(radius: Int(sliderValue))
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
