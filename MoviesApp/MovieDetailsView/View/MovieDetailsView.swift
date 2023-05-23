//
//  MovieDetailsView.swift
//  MoviesApp
//
//  Created by sneha.jarsania on 21/05/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct MovieDetailsView: View {
    @ObservedObject var viewModel = MovieDetailsViewModel(service: NetworkServiceFactory.create())
    @Binding var movieId : String
    
    var body: some View {
        
        ZStack{
            if self.viewModel.showIndicator{
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .gray))
                    .scaleEffect(2)
                    .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .center)
                    .background(.black.opacity(0.0))
            }
            else{
                ScrollView(.vertical) {
                    if let loadData = viewModel.movieDetailsResponse{
                        
                        VStack(alignment: .leading,spacing: 14){
                            MovieImageView(item: loadData)
                                .frame(height: 250)
                            
                            MovieTitleView(viewModel: viewModel, loadData: loadData)
                                
                            
                            GenresView(viewModel: viewModel)
                            
                            OverView(loadData: loadData)
                            
                            Rectangle().fill(Color.gray).frame(width: UIScreen.screenWidth-20, height: 1, alignment: .center)
                            OtherDetailsView(loadData: loadData)
                            
                            Rectangle().fill(Color.gray).frame(width: UIScreen.screenWidth-20, height: 1, alignment: .center)
                            VStack(alignment: .leading, spacing: 6){
                                Text("Production Companies")
                                    .font(.system(size: 15))
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                Text(viewModel.productionCompanies ?? "")
                                    .font(.system(size: 15))
                                    .fontWeight(.regular)
                                    .foregroundColor(.gray)
                            }
                            .frame(alignment: .leading)
                            
                            
                        }
                        .padding(.top,-40)
                        .padding(10)
                        .frame(width: UIScreen.screenWidth,alignment: .leading)
                        Spacer()
                    }
                }
                
            }
        }
        .onAppear{
            initialAction()
        }
    }
    
    public func initialAction(){
        self.viewModel.getMovieDetails(movieId: movieId)
    }
    
}
struct OtherDetailsView : View{
    var loadData : MovieDetailsResponse
    var body: some View {
        return VStack(spacing: 10){
            HStack{
                Text("Status ")
                    .font(.system(size: 15))
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                Text(loadData.status ?? "")
                    .font(.system(size: 15))
                    .fontWeight(.regular)
                    .foregroundColor(.gray)
                Spacer()
            }
            HStack{
                Text("Original Language ")
                    .font(.system(size: 15))
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                if  let lang = loadData.spokenLanguages{
                    Text(lang[0].name ?? "English")
                        .font(.system(size: 15))
                        .fontWeight(.regular)
                        .foregroundColor(.gray)
                    Spacer()
                }
                
            }
            HStack{
                Text("Budget ")
                    .font(.system(size: 15))
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                Text("$ \(loadData.budget)")
                    .font(.system(size: 15))
                    .fontWeight(.regular)
                    .foregroundColor(.gray)
                Spacer()
            }
            HStack{
                Text("Revenue ")
                    .font(.system(size: 15))
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                Text("$ \(loadData.revenue)")
                    .font(.system(size: 15))
                    .fontWeight(.regular)
                    .foregroundColor(.gray)
                Spacer()
            }
            Spacer()
        }
        .padding(.top,15)
        .frame(width: UIScreen.screenWidth-20,height: 110, alignment: .leading)
        
    }
}
struct OverView : View{
    var loadData : MovieDetailsResponse
    var body: some View{
        return VStack(spacing: 6){
            HStack{
                Text("Overview")
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                    
                Spacer()
            }
            .frame(alignment: .leading)
            Text(loadData.overview ?? "")
                .font(.system(size: 15))
                .fontWeight(.regular)
                .foregroundColor(.gray)
        }
        
    }
}
struct GenresView : View{
    var viewModel : MovieDetailsViewModel
    var body: some View{
        return HStack(spacing: 2.0){
            Text(viewModel.genresString ?? "")
                .font(.system(size: 15))
                .fontWeight(.regular)
                .foregroundColor(.gray)
        }
        .frame(width: UIScreen.screenWidth, alignment: .leading)
    }
}
struct MovieTitleView : View{
    var viewModel : MovieDetailsViewModel
    var loadData : MovieDetailsResponse
    
    var body: some View{
       return HStack(spacing: 2.0){
            Text(loadData.originalTitle ?? "")
                .font(.system(size: 22))
                .fontWeight(.semibold)
                .foregroundColor(.black)
            Text(#"(\#(viewModel.releaseYear ?? ""))"#)
                .font(.system(size: 20))
                .fontWeight(.medium)
                .foregroundColor(.black.opacity(7.0))
        }
        .frame(width: UIScreen.screenWidth, alignment: .leading)
    }
}
struct MovieImageView : View{
    let  item : MovieDetailsResponse
    var body: some View{
        return WebImage(url: URL(string: "\(MoviesAppConstant.imageURLPrefix)\(item.posterPath ?? "")"))
                .resizable()
                .placeholder(Image("NoImage"))
                .indicator(.activity)
                .cornerRadius(8)
    }
}
struct MovieDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsView( movieId: .constant("123243"))
    }
}
