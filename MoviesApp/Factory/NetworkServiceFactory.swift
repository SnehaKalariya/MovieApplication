//
//  NetworkServiceFactory.swift
//  MoviesApp
//
//  Created by sneha.jarsania on 20/05/23.
//

import Foundation

class NetworkServiceFactory {
    
    static func create() -> NetworkService{
        return Webservice()
    }
}
