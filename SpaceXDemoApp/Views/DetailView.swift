//
//  DetailView.swift
//  SpaceXDemoApp
//
//  Created by Jan Kučera on 23.10.2021.
//

import SwiftUI

struct DetailView: View {
    
    let detailViewModel: DetailViewModel
    
    var body: some View {
        
        ScrollView {
            
            VStack(alignment: .leading, spacing: 30) {
                
                // Header info:
                VStack {
                    Text(detailViewModel.name)
                        .font(.title3).bold()
                        .padding(.bottom)
                          
                    HStack {
                        VStack(spacing: 10) {
                            Image(systemName: "calendar")
                                .imageScale(.large)
                            Text(detailViewModel.date)
                        }
                        .frame(maxWidth: .infinity)
                        VStack(spacing: 10) {
                            Image(systemName: "person.3.fill")
                                .imageScale(.large)
                            Text(detailViewModel.crewCount)
                        }
                        .frame(maxWidth: .infinity)
                        VStack(spacing: 10) {
                            Image(systemName: "airplane.departure")
                                .imageScale(.large)
                            Text(detailViewModel.success)
                        }
                        .frame(maxWidth: .infinity)
                    }
                }
                .padding()
                .foregroundColor(.primary).colorInvert()
                .background(Color.black)
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                
                // Flight description:
                VStack(alignment: .leading) {
                    Text("Flight details:")
                        .font(.headline)
                        .padding(.bottom, 5)
                    Text(detailViewModel.flightDetails)
                }
                
                // Images:
                VStack(alignment: .leading) {
                    Text("Images:")
                        .font(.headline)
                        .padding(.bottom, 5)
                    
                    if detailViewModel.imageURLs.isNotEmpty {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(detailViewModel.imageURLs.urls, id: \.self) { url in
                                    AsyncImage(url: url) { image in
                                        image
                                            .resizable()
                                            .scaledToFit()
                                            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                                    } placeholder: {
                                        ZStack(alignment: .center) {
                                            Color.secondary
                                            ProgressView()
                                        }
                                        .frame(width: 200)
                                    }
                                    .frame(height: 300)
                                }
                            }
                        }
                    } else {
                        Text("No images found.")
                    }
                }
                
            }
            .padding()
            
        }
        .navigationTitle("Launch")
        .navigationBarTitleDisplayMode(.inline)
        
    }
    
}

