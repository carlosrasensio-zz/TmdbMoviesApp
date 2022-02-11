//
//  c.swift
//  TmdbMoviesAppTests
//
//  Created by crodrigueza on 11/2/22.
//

import XCTest
@testable import TmdbMoviesApp

class MoviesListUnitTests: XCTestCase, DecodableTestCase {
    var sut: Movies!

    override func setUpWithError() throws {
        try super.setUpWithError()
        try! givenSUTFromJSON(fileName: "MockMovies")
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func testConformsToDecodable() {
        XCTAssertTrue((sut as Any) is Decodable)
    }

    func testConformsToEquatable() {
        XCTAssertEqual(sut, sut)
    }

    func testDecodableSetsImage() {
        XCTAssertEqual(sut.movies[0].image, "/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg")
    }

    func testDecodableSetsTitle() {
        XCTAssertEqual(sut.movies[0].title, "Spider-Man: No Way Home")
    }

    func testDecodableSetsDescription() {
        XCTAssertEqual(sut.movies[0].description, "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.")
    }

    func testDecodableSetsVoteAverage() {
        XCTAssertEqual(sut.movies[0].voteAverage, 8.4)
    }
}
