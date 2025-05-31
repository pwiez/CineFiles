//
//  MovieModel.swift
//  CineFiles
//
//  Created by Pedro Wiezel on 30/05/25.
//

import Foundation

struct MovieModel: Identifiable {
    let id = UUID()
    let posterImage: String
    let title: String
    let synopsis: String
    let director: String
    let screenWriters: String
    let releaseYear: String
    var isSaved: Bool = false
    var isWatched: Bool = false
}
