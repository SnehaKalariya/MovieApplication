//
//  MockWebServices.swift
//  MoviesAppTests
//
//  Created by sneha.jarsania on 22/05/23.
//

import Foundation

class MockWebservice: NetworkService {
    
    var result : Result<PopularListResponse, NetworkError>!
    var movieDetailsResult : Result<MovieDetailsResponse, NetworkError>!
    
    func popularListApiCall(completionHandler: @escaping (Swift.Result<PopularListResponse, NetworkError>) -> Void){
        completionHandler(result)
    }
    func movieDetailsApiCall(movieId:String, completionHandler: @escaping (Result<MovieDetailsResponse, NetworkError>) -> Void){
        completionHandler(movieDetailsResult)
    }
    
    func readPopularListLocalJsonFile() -> PopularListResponse?{
        do{
            guard let filePath = Bundle.main.path(forResource: "PopularList", ofType: "json") else{
                return nil
            }
            let fileUrl = URL(fileURLWithPath: filePath)
            let data = try Data(contentsOf: fileUrl)
            let popularListResponse = try JSONDecoder().decode(PopularListResponse.self, from: data)
            return popularListResponse
            
        }catch _{
            return nil
        }
    }
    
    func readDetailsLocalJsonFile() -> MovieDetailsResponse?{
        do{
            guard let filePath = Bundle.main.path(forResource: "MovieDetails", ofType: "json") else{
                return nil
            }
            let fileUrl = URL(fileURLWithPath: filePath)
            let data = try Data(contentsOf: fileUrl)
            let movieDetailsResponse = try JSONDecoder().decode(MovieDetailsResponse.self, from: data)
            return movieDetailsResponse
            
        }catch _{
            return nil
        }
        
        
    }
    
}
