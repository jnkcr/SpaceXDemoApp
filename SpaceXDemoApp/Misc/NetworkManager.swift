//
//  NetworkManager.swift
//  SpaceXDemoApp
//
//  Created by Jan Kučera on 16.10.2021.
//

import Foundation
import Alamofire


enum LaunchesError: String, Error {
    case dataCorrupted = "Downloaded data might be corrupted, please try downloading launches again."
    case unableToParseData = "Downloaded data were not processed correctly, please try downloading launches again."
    case failedToDownloadData = "Unable to download data from server, please check your internet connection and try downloading data again."
}


final class NetworkManager {
    
    /// Downloads all past launches from given api URL
    func downloadPastLaunches(completion: @escaping (Result<[LaunchModel], LaunchesError>) -> Void) {
        
        AF.request("https://api.spacexdata.com/v5/launches/past", method: .get).responseData { response in
            switch response.result {
            case .success(let data):
                // Early check - downloaded data should not be empty
                guard !(data.isEmpty) else {
                    completion(.failure(.dataCorrupted))
                    return
                }
                // Decode data to model
                do {
                    let currentLaunches = try JSONDecoder().decode([LaunchModel].self, from: data)
                    dump(currentLaunches)
                    completion(.success(currentLaunches))
                } catch {
                    print(error.localizedDescription)
                    completion(.failure(.unableToParseData))
                }
            case .failure(let error):
                print(error.localizedDescription)
                completion(.failure(.failedToDownloadData))
            }
        }
        
    }
    
}
