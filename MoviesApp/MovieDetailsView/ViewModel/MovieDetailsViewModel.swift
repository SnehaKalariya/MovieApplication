//
//  MovieDetailsViewModel.swift
//  MoviesApp
//
//  Created by sneha.jarsania on 21/05/23.
//

import Foundation

protocol MovieDetailsViewModelProtocol{
    func getMovieDetails()
}
class MovieDetailsViewModel : ObservableObject{
    private var service: NetworkService
    @Published var movieDetailsResponse : MovieDetailsResponse?
    
    var showIndicator : Bool = true
    
    private(set) lazy var releaseYear : String? = {
        if let resp = movieDetailsResponse {
            let releaseDate = resp.releaseDate
            if let relDate = releaseDate{
                if let i = relDate.firstIndex(of: "-") {
                    return "\(relDate.prefix(upTo: i))"
                }
            }
        }
        return ""
    }()
    
    private(set) lazy var genresString : String? = {
        if let response = movieDetailsResponse{
            if let genres = response.genres{
                var result : String = ""
               _ = genres.compactMap { obj in
                   result.append("\(obj.name ?? ""), ")
                }
                result.removeLast(2)
                return result
            }
           
        }
        return ""
    }()
    
    private(set) lazy var productionCompanies : String? = {
        if let response = movieDetailsResponse{
            if let productionC = response.productionCompanies{
                var result : String = ""
               _ = productionC.compactMap { obj in
                   result.append("\(obj.name ?? ""), ")
                }
                result.removeLast(2)
                return result
            }
           
        }
        return ""
    }()
    
    init(service: NetworkService) {
        self.service = service
    }
    
    //MARK: Popular List API call
    func getMovieDetails(movieId : String){
        self.service.movieDetailsApiCall(movieId: movieId) { resultData in
            switch resultData{
            case .success(let response):
                
                DispatchQueue.main.async {
                    self.showIndicator = false
                    self.movieDetailsResponse = response
                }

            case .failure(let error):
                print("show alert \(error)")
            }
        }

    }

}
