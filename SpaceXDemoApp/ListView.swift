//
//  ListView.swift
//  SpaceXDemoApp
//
//  Created by Jan Kučera on 14.10.2021.
//

import SwiftUI
import Alamofire


struct ListView: View {
    
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    
    var body: some View {
        
        List {
            if listViewModel.launches.isEmpty {
                HStack {
                    ProgressView()
                        .padding(.trailing)
                    Text("Downloading launches..")
                    Spacer()
                }
                .listRowSeparator(.hidden)
            } else {
                ForEach(listViewModel.launches) { launch in
                    Text(launch.name)
                }
                .listRowSeparator(.hidden)
            }
        }
        .listStyle(.plain)
        .navigationTitle("SpaceX launches")
        
    }
    
    
}


struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
