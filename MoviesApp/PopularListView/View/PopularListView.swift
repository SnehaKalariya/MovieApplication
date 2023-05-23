//
//  HomeView.swift
//  MoviesApp
//
//  Created by sneha.jarsania on 19/05/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct PopularListView: View {
    @ObservedObject var viewModel = PopularListViewModel(service: NetworkServiceFactory.create())
    var body: some View {
        let cellList = viewModel.moviesList
        NavigationStack{
            ZStack{
                VStack {
                    List(cellList, id: \.id) { list in
                        
                        NavigationLink(destination: MovieDetailsView( movieId: .constant(String(list.id)))) {
                            PopularListCell(cellItem: list)
                                .frame(height: UIScreen.screenHeight/3.5)
                        }
                        .buttonStyle(.plain)
                    }
                    
                }
                
                if self.viewModel.showIndicator{
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .gray))
                        .scaleEffect(2)
                        .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .center)
                        .background(.black.opacity(0.0))
                }
                
            }
            .navigationTitle("Popular Movies")
        }
        .onAppear{
            initialAction()
        }
        .onDisappear{
            print("Disappear")
        }
    }
    
    public func initialAction(){
        viewModel.getPopularList()
    }
}

struct PopularListCell : View{
    let  cellItem : MoviesResult
    var body: some View{
        return VStack {
            WebImage(url: URL(string: "\(MoviesAppConstant.imageURLPrefix)\(cellItem.posterPath ?? "")"))
                .resizable()
                .placeholder(Image("NoImage"))
                .indicator(.activity)
        }
        .frame(width: UIScreen.screenWidth)
        .padding(-10)
    }
}

struct PopularListView_Previews: PreviewProvider {
    static var previews: some View {
        PopularListView()
    }
}

extension UIScreen{
    static let screenWidth = UIScreen.main.bounds.size.width
    static let screenHeight = UIScreen.main.bounds.size.height
    static let screenSize = UIScreen.main.bounds.size
}
