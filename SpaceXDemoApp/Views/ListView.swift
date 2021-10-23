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
                    NavigationLink(destination: DetailView(detailViewModel: DetailViewModel(launch: launch))) {
                        ListCell(launch: launch)
                            .padding(.vertical, 5)
                    }
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
        .alert(isPresented: $listViewModel.isAlertShown) { alertItem }
        
    }
    
    
}


// MARK: Launches filtering
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
    
    private var actionSheetItems: some View {
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


// MARK: Alert
extension ListView {
    
    private var alertItem: Alert {
        Alert(title: Text("Warning"), message: Text(listViewModel.alertText), dismissButton: .default(Text("Done")))
    }
    
}


// MARK: Toolbar
extension ListView {
    
    private var toolbarItem: some View {
        Button {
            listViewModel.isActionSheetShown = true
        } label: {
            Label("Sort", systemImage: "list.number")
        }
    }
    
}


// MARK: Previews
struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
