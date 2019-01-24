//
//  ModelData.swift
//  MovieAppChallenge
//
//  Created by Kumar,Sunil on 24/01/19.
//  Copyright © 2019 Kumar,Sunil. All rights reserved.
//

import Foundation

class ModelData {
    
    private var movieIndex = -1
    private var movies: [Movie] = []
    
    func startDownloadingData()  {
        
        NetworkAPI.requestGETURL(NetworkConstants.ServerUrl.baseURL, success: { (responseObject) in
            //print(responseObject)
            for movie in responseObject["movies"] as! [Any] {
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: movie, options: .prettyPrinted)
                    let reqJSONStr = String(data: jsonData, encoding: .utf8)
                    let data = reqJSONStr?.data(using: .utf8)
                    let jsonDecoder = JSONDecoder()
                    let movieObj = try jsonDecoder.decode(Movie.self, from: data!) as Movie
                    self.movies.append(movieObj)
                } catch let DecodingError.keyNotFound(key, context) {
                    print("Key '\(key)' not found:", context.debugDescription)
                } catch let DecodingError.valueNotFound(value, context) {
                    print("Value '\(value)' not found:", context.debugDescription)
                } catch let error {
                    print("Error \(error.localizedDescription) ")
                }
            }
            
            NotificationCenter.default.post(name: .didCompleteTask, object: nil)

        }) { (error) in
            print(error.localizedDescription)
            
            NotificationCenter.default.post(name: .didFailedTask, object: nil)
        }

    }
    
    func getMoviesCount() -> Int {
        return movies.count
    }
    
    func getMovieAt(index: Int) -> Movie {
        var movie : Movie!
        if(index < movies.count) {
            movie = movies[index]
        }
        return movie
    }
    
    func setIndex(index: Int) {
        self.movieIndex = index
    }
    
    func index() -> Int {
        return movieIndex
    }
}
