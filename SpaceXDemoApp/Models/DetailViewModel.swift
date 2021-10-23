//
//  DetailViewModel.swift
//  SpaceXDemoApp
//
//  Created by Jan Kučera on 23.10.2021.
//

import Foundation


final class DetailViewModel {
    
    let launch: LaunchModel
    
    var dateDescription: String {
        launch.dateLocal.formatted()
    }
    
    var crewDescription: String {
        launch.crew.isEmpty ? "no crew" : "\(launch.crew.count) members"
    }
    
    var successDescription: String {
        launch.success ? "success" : "failure"
    }
    
    var hasImageURL: Bool {
        launch.links.flickr.small.isEmpty ? false : true
    }
    
    
    init(launch: LaunchModel) {
        self.launch = launch
    }
    
}
