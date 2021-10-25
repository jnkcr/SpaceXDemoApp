//
//  DetailViewModel.swift
//  SpaceXDemoApp
//
//  Created by Jan Kučera on 23.10.2021.
//

import Foundation


final class DetailViewModel {
    
    private let launch: LaunchModel
    
    var name: String {
        launch.name
    }
    
    var date: String {
        launch.dateLocal.formatted()
    }
    
    var crewCount: String {
        launch.crew.isEmpty ? "no crew" : "\(launch.crew.count) members"
    }
    
    var flightNum: String {
        String(launch.flightNumber)
    }
    
    var success: String {
        launch.success ? "success" : "failure"
    }
    
    var imageURLs: (isNotEmpty: Bool, urls: [URL]) {
        guard !(launch.links.flickr.original.isEmpty) else { return (false, []) }
        
        var urlArray: [URL] = []
        
        for link in launch.links.flickr.original {
            guard let url = URL(string: link!) else { return (false, []) }
            urlArray.append(url)
        }
        
        return (true, urlArray)
    }
    
    var flightDetails: String {
        if let details = launch.details {
            return details
        } else {
            return "No details provided."
        }
    }
    
    
    init(launch: LaunchModel) {
        self.launch = launch
    }
    
}
