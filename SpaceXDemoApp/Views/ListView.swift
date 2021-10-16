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
                ForEach(launches) { launch in
                    Text(launch.name)
                }
                .listRowSeparator(.hidden)
            }
        }
        .listStyle(.plain)
        .refreshable { listViewModel.downloadLaunches() }
        .searchable(text: $listViewModel.textForSearching)
        .navigationTitle("SpaceX launches")
        
    }
    
    
}


extension ListView {
    
    private var launches: [LaunchModel] {
        if listViewModel.textForSearching.isEmpty {
            return listViewModel.launches
        } else {
            return listViewModel.launches.filter { $0.name.lowercased().contains(listViewModel.textForSearching.lowercased()) }
        }
    }
    
}


struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
