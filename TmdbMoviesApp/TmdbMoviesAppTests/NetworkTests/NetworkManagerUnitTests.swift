//
//  NetworkManagerUnitTests.swift
//  TmdbMoviesAppTests
//
//  Created by crodrigueza on 11/2/22.
//

import XCTest
@testable import TmdbMoviesApp

class NetworkManagerUnitTests: XCTestCase {
    var networkManager: NetworkManager!

    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        networkManager = nil
        try super.tearDownWithError()
    }

    func testNetworkManagerResponseIsNotNil() {
        networkManager = NetworkManager()
        let response = networkManager.getMovies()
        XCTAssertNotNil(response)
    }
}
