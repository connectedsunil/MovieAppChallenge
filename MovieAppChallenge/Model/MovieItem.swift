//
//  MovieItem.swift
//  MovieAppChallenge
//
//  Created by Kumar,Sunil on 23/01/19.
//  Copyright © 2019 Kumar,Sunil. All rights reserved.
//

import UIKit

class MovieItem: NSObject {
    var image: UIImage
    var title: String
    
    init(image: UIImage, title: String) {
        self.image = image
        self.title = title
    }
}

//struct Movie: Codable {
//    let Title: String
//    let Year: String
//    let Genre: String
//}


struct Movie: Codable {
    
    var title: String!
    var posterUrl: String!
    var posterUrl2: String!
    var year: String!
    var runtime: String!
    var language: String!
    var genre: String!
    var director: String!
    var actors: String!
    var plot: String!
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        if let title = try container.decodeIfPresent(String.self, forKey: .title) {
            self.title = title
        }
        if let poster = try container.decodeIfPresent(String.self, forKey: .posterUrl) {
            self.posterUrl = poster
        }
        if let poster = try container.decodeIfPresent(String.self, forKey: .posterUrl2) {
            self.posterUrl = poster
        }
        if let year = try container.decodeIfPresent(String.self, forKey: .year) {
            self.year = year
        }
        if let runtime = try container.decodeIfPresent(String.self, forKey: .runtime) {
            self.runtime = runtime
        }
        if let language = try container.decodeIfPresent(String.self, forKey: .language) {
            self.language = language
        }
        if let genre = try container.decodeIfPresent(String.self, forKey: .genre) {
            self.genre = genre
        }
        if let director = try container.decodeIfPresent(String.self, forKey: .director) {
            self.director = director
        }
        if let actors = try container.decodeIfPresent(String.self, forKey: .actors) {
            self.director = actors
        }
        if let plot = try container.decodeIfPresent(String.self, forKey: .plot) {
            self.plot = plot
        }
        
        
    }
}

extension Movie {
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case posterUrl = "Poster"
        case posterUrl2 = "Poster "
        case year = "Year"
        case runtime = "Runtime"
        case language = "Language"
        case genre = "Genre"
        case director = "Director"
        case actors = "Actors"
        case plot = "Plot"
    }
}
