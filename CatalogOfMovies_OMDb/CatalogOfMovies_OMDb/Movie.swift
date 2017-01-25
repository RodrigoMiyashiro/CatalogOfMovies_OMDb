//
//  Movie.swift
//  CatalogOfMovies_OMDb
//
//  Created by Rodrigo A E Miyashiro on 20/01/17.
//  Copyright © 2017 Rodrigo Miyashiro. All rights reserved.
//

import Foundation
import  JSONJoy


class Movie: JSONJoy {
    
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
    var poster: (String, NSData)
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
        poster = ("", NSData())
        metascore = ""
        imdbRating = ""
        imdbVotes = ""
        imdbID = ""
        type = ""
        response = ""
    }
    
    required init(_ decoder: JSONDecoder) throws {
        title = try decoder["Title"].get()
        year = try decoder["Year"].get()
        released = try decoder["Released"].get()
        runtime = try decoder["Runtime"].get()
        genre = try decoder["Genre"].get()
        director = try decoder["Director"].get()
        writer = try decoder["Writer"].get()
        actors = try decoder["Actors"].get()
        plot = try decoder["Plot"].get()
        language = try decoder["Language"].get()
        country = try decoder["Country"].get()
        awards = try decoder["Awards"].get()
        poster = (try decoder["Poster"].get(), NSData())
        metascore = try decoder["Metascore"].get()
        imdbRating = try decoder["imdbRating"].get()
        imdbVotes = try decoder["imdbVotes"].get()
        imdbID = try decoder["imdbID"].get()
        type = try decoder["Type"].get()
        response = try decoder["Response"].get()
    }
}
