//
//  SplashView.swift
//  AirportSearch
//
//  Created by Kike Hernandez D. on 25/09/22.
//

import SwiftUI

/* MARK: - Comment
 
 This is the splash screen that changes into the main view after 2.5 seconds
 
*/

struct SplashView: View {
    @State private var isActive = false
    var body: some View {
        if(isActive) {
            ContentView()
        }
        else {
            VStack{
                Image("Logo")
                Text("by KIKE-H")
                    .font(.title2)
                    .padding(.top, 40)
            }.onAppear {
                DispatchQueue.main.asyncAfter(wallDeadline: .now()+2.5) {
                    self.isActive = true
                }
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
