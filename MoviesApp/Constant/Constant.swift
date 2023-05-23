//
//  Constant.swift
//  MoviesApp
//
//  Created by sneha.jarsania on 20/05/23.
//

import Foundation

struct MoviesAppConstant{
    static var imageURLPrefix = "https://image.tmdb.org/t/p/w1280"
    static var webServiceHeader = [
        "accept": "application/json",
        "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0ZmRhOGEyOGYwODhkYmIwYTVmOWM2ODEzZTk4YTFmZCIsInN1YiI6IjY0NjcwZGRlMzNhMzc2MDE1OGQ4ZThkMSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.XXKcTBNUho_O-g-bzjqIWy1PyuBEwAAmwo1iZdWI4WQ"
      ]
    static var baseUrl = "https://api.themoviedb.org/3/movie/"
    static var poularListUrl = "popular?language=en-US&page=1"
    static var detailsUrl = "language=en-US"
}
