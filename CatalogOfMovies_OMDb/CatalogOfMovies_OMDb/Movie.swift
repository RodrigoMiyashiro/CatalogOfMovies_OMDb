//
//  Movie.swift
//  CatalogOfMovies_OMDb
//
//  Created by Rodrigo A E Miyashiro on 20/01/17.
//  Copyright © 2017 Rodrigo Miyashiro. All rights reserved.
//

import Foundation


class Movie {
    
    var title: String
    var year: String
    var released: String
    var runtime: String
    var genre: String
    var director: String
    var writer: String
    var actors: String
    var plot: String
    var language: String
    var country: String
    var awards: String
    var poster: String
    var metascore: String
    var imdbRating: String
    var imdbVotes: String
    var imdbID: String
    var type: String
    var response: String
    
    
    init() {
        title = ""
        year = ""
        released = ""
        runtime = ""
        genre = ""
        director = ""
        writer = ""
        actors = ""
        plot = ""
        language = ""
        country = ""
        awards = ""
        poster = ""
        metascore = ""
        imdbRating = ""
        imdbVotes = ""
        imdbID = ""
        type = ""
        response = ""
    }
}
