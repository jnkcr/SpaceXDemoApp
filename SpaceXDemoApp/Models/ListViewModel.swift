//
//  ListViewModel.swift
//  SpaceXDemoApp
//
//  Created by Jan Kučera on 16.10.2021.
//

import SwiftUI


final class ListViewModel: ObservableObject {
    
    
    @AppStorage("sortingOrder") var sortingOrder: Int = 1
    
    @Published var launches: [LaunchModel] = [LaunchModel]()
    @Published var textForSearching: String = ""
    @Published var isActionSheetShown: Bool = false
    
    @Published var isAlertShown: Bool = false
    var alertText: String = ""
    
    @Published var isDownloadingPopUpVisible: Bool = false
    
    private let networkManager: NetworkManager = NetworkManager()
    
    
    init() {
        downloadLaunches()
    }
    
    init(with launchData: [LaunchModel]) {
        launches = launchData
    }
    
    
}


// MARK: Downloading launches
extension ListViewModel {
    
    /// Downloads all past launches and loads them to viewmodel
    func downloadLaunches() {
        // Show popup first as visual clue to user
        withAnimation(.easeOut(duration: 0.1)) {
            isDownloadingPopUpVisible = true
        }
        // Attempt to download data
        networkManager.downloadPastLaunches { result in
            switch result {
            case .success(let data):
                // Load downloaded data to viewmodel and hide popup
                self.launches = self.sortLaunches(data)
                withAnimation(.easeIn(duration: 0.3)) {
                    self.isDownloadingPopUpVisible = false
                }
            case .failure(let error):
                // Trigger alert with error message
                self.alertText = error.rawValue
                self.isAlertShown.toggle()
            }
        }
    }
    
}


// MARK: Sorting launches
extension ListViewModel {
    
    /// Sorts undelying data by given key
    /// - Parameter key: key represented by Int (0 - name, 1 - date, 2 - flight num.)
    func sortLaunches(by key: Int) {
        // Better to sort via enum
        sortingOrder = key
        launches = sortLaunches(launches)
    }
    
    private func sortLaunches(_ givenLaunches: [LaunchModel]) -> [LaunchModel] {
        switch sortingOrder {
        case 1:
            return givenLaunches.sorted { $0.dateUTC > $1.dateUTC } // Date descending
        case 2:
            return givenLaunches.sorted { $0.flightNumber < $1.flightNumber } // Flight number
        default:
            return givenLaunches.sorted { $0.name < $1.name } // Name
        }
    }
    
}
