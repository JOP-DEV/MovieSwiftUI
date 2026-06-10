//
//  HomeView.swift
//  MovieSwiftUI
//
//  Created by Pinedo on 9/06/26.
//

import SwiftUI

struct HomeView: View {
    var testTitle = Constants.testTitleURL
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: testTitle)) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
            
            HStack {
                Button {
                    
                } label: {
                    Text(Constants.play)
                        .ghostButton()
                }
                
                Button {
                    
                } label: {
                    Text(Constants.download)
                        .ghostButton()
                }
                
            }
        }
    }
}

#Preview {
    HomeView()
}
