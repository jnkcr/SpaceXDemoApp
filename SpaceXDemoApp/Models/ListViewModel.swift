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
    
    private let networkManager: NetworkManager = NetworkManager()
    
    init() {
        networkManager.downloadLaunches { launches in
            guard let newLaunches = launches else { return }
            self.launches = newLaunches
        }
    }
    
}


extension ListViewModel {
    
    
    
}
