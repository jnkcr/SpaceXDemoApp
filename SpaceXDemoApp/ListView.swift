//
//  ListView.swift
//  SpaceXDemoApp
//
//  Created by Jan Kučera on 14.10.2021.
//

import SwiftUI
import Alamofire


struct ListView: View {
    
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    
    var body: some View {
        
        Text("SpaceX launches")
            .navigationTitle("SpaceX launches")
        
    }
    
    
}


struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
