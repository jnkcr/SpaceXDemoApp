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
                    ListCell(launch: launch)
                }
                .listRowSeparator(.hidden)
            }
        }
        .listStyle(.plain)
        .refreshable { listViewModel.downloadLaunches() }
        .searchable(text: $listViewModel.textForSearching)
        .navigationTitle("SpaceX launches")
        .toolbar { toolbarItem }
        .confirmationDialog("Sort results by:", isPresented: $listViewModel.isActionSheetShown) { actionSheetItems }
        
    }
    
    
}


// MARK: Launches sorting
extension ListView {
    
    private var launches: [LaunchModel] {
        if listViewModel.textForSearching.isEmpty {
            return listViewModel.launches
        } else {
            return listViewModel.launches.filter { $0.name.lowercased().contains(listViewModel.textForSearching.lowercased()) }
        }
    }
    
}


// MARK: Action sheet
extension ListView {
    
    var actionSheetItems: some View {
        VStack {
            Button("Name") {
                listViewModel.sortLaunches(by: 0)
            }
            Button("Date (descending)") {
                listViewModel.sortLaunches(by: 1)
            }
            Button("Flight number") {
                listViewModel.sortLaunches(by: 2)
            }
        }
    }
    
}


// MARK: Toolbar
extension ListView {
    
    var toolbarItem: some View {
        Button {
            listViewModel.isActionSheetShown = true
        } label: {
            Label("Sort", systemImage: "list.number")
        }
    }
    
}


struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
