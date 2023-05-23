//
//  HomeViewModel.swift
//  MoviesApp
//
//  Created by sneha.jarsania on 19/05/23.
//

import Foundation

protocol PopularListViewModelProtocol{
    func getPopularList()
}

class PopularListViewModel : ObservableObject, PopularListViewModelProtocol{
    private var service: NetworkService
    @Published var moviesList = [MoviesResult]()
    
    @Published var showIndicator : Bool = true

    init(service: NetworkService) {
        self.service = service
    }
    
    //MARK: Popular List API call
    func getPopularList(){
        self.service.popularListApiCall { resultData in
            switch resultData{
            case .success(let response):
                self.filterResponse(response: response)
            case .failure(let error):
                print("show alert \(error)")
            }
        }
    }
    func filterResponse(response: PopularListResponse){
        var sortedResult = [MoviesResult]()
        if let results = response.results{
             sortedResult = results.sorted {
                $0.popularity > $1.popularity
            }
        }
        DispatchQueue.main.async {
                self.showIndicator = false

                if sortedResult.count > 10{
                    let list = sortedResult[0...9]
                    print(list)
                    self.moviesList = Array(list)
                }else{
                    self.moviesList = sortedResult
                }
                
            }
        
        
    }

}
