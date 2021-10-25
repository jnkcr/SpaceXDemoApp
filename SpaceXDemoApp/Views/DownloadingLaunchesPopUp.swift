//
//  DownloadingLaunchesPopUp.swift
//  SpaceXDemoApp
//
//  Created by Jan Kučera on 23.10.2021.
//

import SwiftUI

struct DownloadingLaunchesPopUp: View {
    
    var body: some View {
        
        HStack {
            ProgressView()
                .scaleEffect(1.3)
                .padding(.trailing)
            Text("Downloading..")
        }
        .padding(.vertical, 20)
        .frame(maxWidth: .infinity)
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
        
    }
}

struct DownloadingLaunchesPopUp_Previews: PreviewProvider {
    static var previews: some View {
        DownloadingLaunchesPopUp()
    }
}
