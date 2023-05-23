//
//  PopularListViewModelTests.swift
//  MoviesAppTests
//
//  Created by sneha.jarsania on 22/05/23.
//

import XCTest
import Combine
@testable import MoviesApp

final class PopularListViewModelTests: XCTestCase {

  
    func test_API_Failure(){
        let webService = MockWebservice()
        webService.result = .failure(.badRequest)
        let sut = PopularListViewModel(service: webService)
        sut.getPopularList()
        XCTAssert(sut.moviesList.isEmpty)
    
    }
    func test_API_Success(){
        let webService = MockWebservice()
        guard let response = webService.readPopularListLocalJsonFile() else{
            return
        }
        webService.result = .success(response)
        let sut = PopularListViewModel(service: webService)
        sut.getPopularList()
        
        XCTAssert(!sut.moviesList.isEmpty)
    }
    
    func test_popularlist_filter_data(){
        let webService = MockWebservice()
        guard let response = webService.readPopularListLocalJsonFile() else{
            return XCTFail("Error")
        }
        webService.result = .success(response)
        let sut = PopularListViewModel(service: webService)
        sut.filterResponse(response: response)

        let expectation = XCTestExpectation(description: "Fetch Popular List")

        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0, execute: {
            XCTAssertEqual(sut.moviesList.count, 10)
            expectation.fulfill()
        })

        wait(for: [expectation], timeout: 2.0)
    }

}
