//
//  MovieListScreen.swift
//  MovieAppChallenge
//
//  Created by Kumar,Sunil on 23/01/19.
//  Copyright © 2019 Kumar,Sunil. All rights reserved.
//

import UIKit

class MovieListScreen: BaseViewController {

    @IBOutlet weak var movieListTableView: UITableView!
    
    var model = ModelData()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Movies"
        
        NotificationCenter.default.addObserver(self, selector: #selector(onDidReceiveData(_:)), name: .didCompleteTask, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(onDidReceiveData(_:)), name: .didFailedTask, object: nil)
        
        showActivityIndicator()
        model.startDownloadingData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailsSegue" {
            let selectedMovie = model.getMovieAt(index: model.index())

            if let detailedScreen = segue.destination as? MovieDetailsScreen {
                detailedScreen.setMovieDetails(movie: selectedMovie)
            }
        }
    }
    
    @objc func onDidReceiveData(_ notification:Notification) {
        DispatchQueue.main.async {
            self.movieListTableView.reloadData()
            self.hideActivityIndicator()
        }
    }
    
    @objc func onDidFailedData(_ notification:Notification) {
        hideActivityIndicator()
    }

}


extension MovieListScreen: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return movies.count
        return model.getMoviesCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let movie = movies[indexPath.row]
        let movie = model.getMovieAt(index: indexPath.row)
        
        let movieCell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as! MovieItemCell
        movieCell.setMovieItem(movie: movie)
        
        return movieCell
    }
    
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        model.setIndex(index: indexPath.row)
    } 
    
}
