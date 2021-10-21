//
//  ListCell.swift
//  SpaceXDemoApp
//
//  Created by Jan Kučera on 21.10.2021.
//

import SwiftUI

struct ListCell: View {
    
    
    let launch: LaunchModel
    
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text(launch.dateLocal.formatted())
                .font(.caption)
                .foregroundStyle(.secondary)
            Text(launch.name)
                .fontWeight(.medium)
                .font(.title3)
        }
        
    }
    
}
