//
//  NetworkManager.swift
//  SpaceXDemoApp
//
//  Created by Jan Kučera on 16.10.2021.
//

import Foundation
import Alamofire


final class NetworkManager {
    
    /// Downloads all past launches from given api URL
    func downloadLaunches(completion: @escaping ([LaunchModel]?) -> Void) {
        
        AF.request("https://api.spacexdata.com/v5/launches/past", method: .get).responseData { response in
            switch response.result {
            case .success(let data):
                // Early check - downloaded data should not be empty
                guard !(data.isEmpty) else {
                    completion(nil)
                    return
                }
                // Decode data to model
                do {
                    let currentLaunches = try JSONDecoder().decode([LaunchModel].self, from: data)
                    dump(currentLaunches)
                    completion(currentLaunches)
                } catch {
                    print(error.localizedDescription)
                    completion(nil)
                }
            case .failure(let error):
                print(error.localizedDescription)
                completion(nil)
            }
        }
        
    }
    
}
