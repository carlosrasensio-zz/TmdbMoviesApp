//
//  Movie.swift
//  TmdbMoviesApp
//
//  Created by crodrigueza on 9/11/21.
//

import Foundation
import UIKit

struct Movie: Codable {
    let image: UIImage
    let title: String
    let descriptio: String
    let voteAverage: Double
}
