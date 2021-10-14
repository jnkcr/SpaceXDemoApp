//
//  ListView.swift
//  SpaceXDemoApp
//
//  Created by Jan Kučera on 14.10.2021.
//

import SwiftUI


struct ListView: View {
    
    
    var body: some View {
        
        Button("Download", action: downloadData)
        
    }
    
    
}


extension ListView {
    
    func downloadData() {
        
    }
    
}


struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
