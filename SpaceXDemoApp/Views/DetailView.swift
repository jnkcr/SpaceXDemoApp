//
//  DetailView.swift
//  SpaceXDemoApp
//
//  Created by Jan Kučera on 23.10.2021.
//

import SwiftUI

struct DetailView: View {
    
    let launch: LaunchModel
    
    var body: some View {
        
        VStack {
            Text("Name: \(launch.name)")
            Text("Date: \(launch.dateLocal.formatted())")
            Text("Number: \(launch.flightNumber)")
            
        }
        .navigationTitle("Launch")
        .navigationBarTitleDisplayMode(.inline)
        
    }
    
}

