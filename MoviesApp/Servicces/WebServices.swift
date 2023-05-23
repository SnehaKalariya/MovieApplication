//
//  WebServices.swift
//  MoviesApp
//
//  Created by sneha.jarsania on 19/05/23.
//

import Foundation

enum NetworkError: Error {
    case badRequest
    case decodingError
    case notAuthenticated
}

protocol NetworkService {
    func popularListApiCall(completionHandler: @escaping (Result<PopularListResponse, NetworkError>) -> Void)
    func movieDetailsApiCall(movieId:String, completionHandler: @escaping (Swift.Result<MovieDetailsResponse, NetworkError>) -> Void)
}

class Webservice: NetworkService {
    func popularListApiCall(completionHandler: @escaping (Result<PopularListResponse, NetworkError>) -> Void){
 
        let request = NSMutableURLRequest(url: NSURL(string: "\(MoviesAppConstant.baseUrl)\(MoviesAppConstant.poularListUrl)")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = MoviesAppConstant.webServiceHeader

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
          if (error != nil) {
            print(error as Any)
          } else {
              guard let data = data, error == nil,
                    (response as? HTTPURLResponse)?.statusCode == 200 else {
                  completionHandler(.failure(.badRequest))
                  return
              }
              guard let popularListResponse = try? JSONDecoder().decode(PopularListResponse.self, from: data) else {
                  
                  completionHandler(.failure(.decodingError))
                  return
              }
              completionHandler(.success(popularListResponse))
          }
        })
        dataTask.resume()
    }
    
    func popularListApiCall1(completionHandler: @escaping (Swift.Result<PopularListResponse, NetworkError>) -> Void){
 
        let request = NSMutableURLRequest(url: NSURL(string: "\(MoviesAppConstant.baseUrl)\(MoviesAppConstant.poularListUrl)")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = MoviesAppConstant.webServiceHeader

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
          if (error != nil) {
            print(error as Any)
          } else {
              guard let data = data, error == nil,
                    (response as? HTTPURLResponse)?.statusCode == 200 else {
                  completionHandler(.failure(.badRequest))
                  return
              }
              guard let popularListResponse = try? JSONDecoder().decode(PopularListResponse.self, from: data) else {
                  
                  completionHandler(.failure(.decodingError))
                  return
              }
              completionHandler(.success(popularListResponse))
          }
        })
        dataTask.resume()
    }
    func movieDetailsApiCall(movieId:String, completionHandler: @escaping (Swift.Result<MovieDetailsResponse, NetworkError>) -> Void){
        let request = NSMutableURLRequest(url: NSURL(string: "\(MoviesAppConstant.baseUrl)\(movieId)?\(MoviesAppConstant.poularListUrl)")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = MoviesAppConstant.webServiceHeader

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
          if (error != nil) {
            print(error as Any)
          } else {
              guard let data = data, error == nil,
                    (response as? HTTPURLResponse)?.statusCode == 200 else {
                  completionHandler(.failure(.badRequest))
                  return
              }
              guard let movieDetailsResponse = try? JSONDecoder().decode(MovieDetailsResponse.self, from: data) else {
                  
                  completionHandler(.failure(.decodingError))
                  return
              }
              completionHandler(.success(movieDetailsResponse))
          }
        })
        dataTask.resume()
    }
    
}
