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
    
    init() {
        downloadLaunches()
    }
    
}


extension ListViewModel {
    
    /// Downloads all past launches from given api URL
    func downloadLaunches() {
        
        AF.request("https://api.spacexdata.com/v5/launches/past", method: .get).responseData { response in
            switch response.result {
            case .success(let data):
                guard !data.isEmpty else { return }
                do {
                    let currentLaunches = try JSONDecoder().decode([LaunchModel].self, from: data)
                    self.launches = currentLaunches
                    dump(currentLaunches)
                } catch {
                    print(error.localizedDescription)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
    }
    
}
