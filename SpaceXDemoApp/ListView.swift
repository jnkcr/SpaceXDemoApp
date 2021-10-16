//
//  ListView.swift
//  SpaceXDemoApp
//
//  Created by Jan Kučera on 14.10.2021.
//

import SwiftUI
import Alamofire


struct ListView: View {
    
    
    var body: some View {
        
        Button("Download", action: downloadData)
        
    }
    
    
}


extension ListView {
    
    func downloadData() {
        
        AF.request("https://api.spacexdata.com/v5/launches/past", method: .get).responseData { response in
            switch response.result {
            case .success(let data):
                guard !data.isEmpty else { return }
                do {
                    let lunches = try JSONDecoder().decode([LaunchModel].self, from: data)
                    dump(lunches)
                } catch {
                    print(error.localizedDescription)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
    }
    
}


struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
