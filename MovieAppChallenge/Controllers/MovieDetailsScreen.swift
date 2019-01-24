//
//  MovieDetailsScreen.swift
//  MovieAppChallenge
//
//  Created by Kumar,Sunil on 23/01/19.
//  Copyright © 2019 Kumar,Sunil. All rights reserved.
//

import UIKit
import Nuke

class MovieDetailsScreen: UIViewController {
    
    var currentMovie : Movie!
    
    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Movie Details"
        
        moviePoster.image = UIImage(named: "no_preview")

        if let posterUrl = currentMovie.posterUrl {
            if let imageUrl = URL.init(string: posterUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!) {
                
                Nuke.loadImage(
                    with: imageUrl,
                    options: ImageLoadingOptions(
                        placeholder: UIImage(named: "no_preview"),
                        transition: .fadeIn(duration: 0.33)
                    ),
                    into: moviePoster
                )
            }
            
        }
        
        movieTitle.text = currentMovie.title
    }
    
    func setMovieDetails(movie: Movie) {
        currentMovie = movie

    }

}
