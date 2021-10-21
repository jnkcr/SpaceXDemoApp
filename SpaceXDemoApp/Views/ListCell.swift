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
            Text(formattedDate)
                .font(.caption)
                .foregroundStyle(.secondary)
            Text(launch.name)
                .fontWeight(.medium)
                .font(.title3)
        }
        
    }
    
}

extension ListCell {
    
    var formattedDate: String {
        let formatter = ISO8601DateFormatter()
        guard let date = formatter.date(from: launch.dateLocal) else { return "n/a" }
        return date.formatted(date: .abbreviated, time: .omitted)
        
    }
    
}

