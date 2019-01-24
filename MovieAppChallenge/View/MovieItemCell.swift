//
//  MovieItemCell.swift
//  MovieAppChallenge
//
//  Created by Kumar,Sunil on 23/01/19.
//  Copyright © 2019 Kumar,Sunil. All rights reserved.
//

import UIKit
import Nuke

class MovieItemCell: UITableViewCell {

    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    
    
    
    func setMovieItem(movie: Movie)  {
        movieImage.image = UIImage(named: "no_preview")
        
        if let posterUrl = movie.posterUrl {
            if let imageUrl = URL.init(string: posterUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!) {

                Nuke.loadImage(
                    with: imageUrl,
                    options: ImageLoadingOptions(
                        placeholder: UIImage(named: "no_preview"),
                        transition: .fadeIn(duration: 0.33)
                    ),
                    into: movieImage
                )
            }
            
        }

        movieTitle.text = movie.title
    }

}
