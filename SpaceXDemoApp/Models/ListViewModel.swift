//
//  ListViewModel.swift
//  SpaceXDemoApp
//
//  Created by Jan Kučera on 16.10.2021.
//

import SwiftUI
import Alamofire


final class ListViewModel: ObservableObject {
    
    
    @Published var launches: [LaunchModel] = [LaunchModel]()
    @Published var textForSearching: String = ""
    
    private let networkManager: NetworkManager = NetworkManager()
    
    
    init() {
        downloadLaunches()
    }
    
    
}


extension ListViewModel {
    
    func downloadLaunches() {
        networkManager.downloadPastLaunches { launches in
            guard let newLaunches = launches else { return }
            self.launches = newLaunches
        }
    }
    
}
