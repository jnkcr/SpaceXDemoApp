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
        
        Text(launch.name)
        
    }
    
}

