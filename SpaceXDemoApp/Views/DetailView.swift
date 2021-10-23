//
//  DetailView.swift
//  SpaceXDemoApp
//
//  Created by Jan Kučera on 23.10.2021.
//

import SwiftUI

struct DetailView: View {
    
    let detailViewModel: DetailViewModel
    
    var body: some View {
        
        VStack {
            Text("Name: \(detailViewModel.launch.name)")
            Text("Date: \(detailViewModel.launch.dateLocal.formatted())")
            Text("Number: \(detailViewModel.launch.flightNumber)")
            
        }
        .navigationTitle("Launch")
        .navigationBarTitleDisplayMode(.inline)
        
    }
    
}

