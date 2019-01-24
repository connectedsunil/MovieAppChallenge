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
    
    @IBOutlet weak var movieLanguage: UILabel!
    @IBOutlet weak var movieReleaseDate: UILabel!
    @IBOutlet weak var movieRunTime: UILabel!
    @IBOutlet weak var movieGenre: UILabel!
    @IBOutlet weak var moviePlot: UILabel!
    
    
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
        movieLanguage.text = currentMovie.language
        movieReleaseDate.text = currentMovie.year
        movieRunTime.text = currentMovie.runtime
        movieGenre.text = currentMovie.genre
        movieGenre.text = currentMovie.genre
        
        let labelHeight = moviePlot.optimalHeight
        moviePlot.frame = CGRect(x: moviePlot.frame.origin.x, y: moviePlot.frame.origin.y,
                                   width: moviePlot.frame.width, height: labelHeight)
        moviePlot.lineBreakMode = .byWordWrapping
        moviePlot.text = currentMovie.plot
        
        
    }
    
    func setMovieDetails(movie: Movie) {
        currentMovie = movie

    }

}

extension UILabel {
    var optimalHeight : CGFloat {
        get
        {
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.width, height: CGFloat.greatestFiniteMagnitude))
            label.numberOfLines = 0
            label.lineBreakMode = NSLineBreakMode.byWordWrapping
            label.font = self.font
            label.text = self.text
            label.sizeToFit()
            return label.frame.height
        }
        
    }
}
