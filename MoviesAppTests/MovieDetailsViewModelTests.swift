//
//  MovieDetailsViewModel.swift
//  MoviesAppTests
//
//  Created by sneha.jarsania on 23/05/23.
//

import XCTest

final class MovieDetailsViewModelTests: XCTestCase {
    var sut : MovieDetailsViewModel!
    let webService = MockWebservice()

    override func setUp() async throws {
        sut = MovieDetailsViewModel(service: webService)
    }

    func test_API_Failure(){
        webService.movieDetailsResult = .failure(.badRequest)
        sut.getMovieDetails(movieId: "502356")
        XCTAssertNil(sut.movieDetailsResponse)
    
    }
    func test_API_Success(){
        guard let response = webService.readDetailsLocalJsonFile() else{
            return XCTFail("Errror")
        }
        webService.movieDetailsResult = .success(response)
        let sut = MovieDetailsViewModel(service: webService)
        sut.getMovieDetails(movieId: "502356")
        
        XCTAssertNil(sut.movieDetailsResponse)
    }
    
    func test_get_release_year(){
        guard let response = webService.readDetailsLocalJsonFile() else{
            return XCTFail("Errror")
        }
        sut.movieDetailsResponse = response
        
        XCTAssertNotEqual(sut.releaseYear, "")
        
    }
    func test_genresString(){
        guard let response = webService.readDetailsLocalJsonFile() else{
            return XCTFail("Errror")
        }
        
        sut.movieDetailsResponse = response
        
        XCTAssertNotNil(sut.genresString)
        XCTAssertNotEqual(sut.genresString, "")
    }
    
    func test_productionCompanies(){
        guard let response = webService.readDetailsLocalJsonFile() else{
            return XCTFail("Errror")
        }
        
        sut.movieDetailsResponse = response
        
        XCTAssertNotNil(sut.productionCompanies)
        XCTAssertNotEqual(sut.productionCompanies, "")
    }
}
