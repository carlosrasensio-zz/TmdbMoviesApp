//
//  TmdbMoviesAppTests.swift
//  TmdbMoviesAppTests
//
//  Created by crodrigueza on 8/11/21.
//

import XCTest
@testable import TmdbMoviesApp

class TmdbMoviesAppTests: XCTestCase {
    // MARK: - Variables
    let networkManager = NetworkManager()

    // MARK: - Default UnitTesting methods
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // MARK: - NetworkManager test
    func testNetworkManager() {
        let movies = networkManager.getMovies()
        XCTAssertNotNil(movies)
    }
}
