//
//  HomeView.swift
//  MoviesApp
//
//  Created by sneha.jarsania on 19/05/23.
//

import SwiftUI

struct PopularListView: View {
    var body: some View {
        VStack {
            List{
                ForEach(0..<10){ index in
                   Text("Movie")
                }
            }
            
        }
        .padding(-10)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        PopularListView()
    }
}
