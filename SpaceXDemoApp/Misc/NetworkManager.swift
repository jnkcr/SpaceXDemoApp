//
//  NetworkManager.swift
//  SpaceXDemoApp
//
//  Created by Jan Kučera on 16.10.2021.
//

import Foundation
import Alamofire
import os.log


final class NetworkManager {
    
    let logger = Logger()
    
    /// Downloads all past launches from given api URL
    /// - Parameter completion: Result in form of data of launches in succes case or error otherwise
    func downloadPastLaunches(completion: @escaping (Result<[LaunchModel], LaunchesError>) -> Void) {
        
        AF.request(URLaddresses.allPastLaunches, method: .get).responseData { response in
            switch response.result {
            case .success(let data):
                // Early check - downloaded data should not be empty
                guard !(data.isEmpty) else {
                    completion(.failure(.dataCorrupted))
                    self.logger.debug("No data after successful download")
                    return
                }
                // Decode data to model
                do {
                    let currentLaunches = try JSONDecoder().decode([LaunchModel].self, from: data)
                    #if DEBUG
                    dump(currentLaunches)
                    #endif
                    completion(.success(currentLaunches))
                } catch {
                    self.logger.debug("Unable to parse downloaded data: \(error.localizedDescription)")
                    completion(.failure(.unableToParseData))
                }
            case .failure(let error):
                self.logger.debug("Unable to download data: \(error.localizedDescription)")
                completion(.failure(.failedToDownloadData))
            }
        }
        
    }
    
}
