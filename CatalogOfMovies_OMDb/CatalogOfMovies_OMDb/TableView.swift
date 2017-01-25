//
//  TableView.swift
//  CatalogOfMovies_OMDb
//
//  Created by Rodrigo A E Miyashiro on 22/01/17.
//  Copyright © 2017 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

extension SearchViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let CellIdentifier = "IdentifierMovieCell"
        let cell = tableViewMovie.dequeueReusableCell(withIdentifier: CellIdentifier, for: indexPath) as! SearchTableViewCell
        
        let row = indexPath.row
        let movie = self.movies[row]
        
        let imgName = movie.poster
        Request.getImage(url: imgName.0) { (imgData) in
            cell.imgMovie.image = UIImage(data: imgData)
        }
        
        cell.lblMovieName.text = movie.title
        cell.lblMovieDirector.text = movie.director
        cell.lblMovieYear.text = movie.year
        
        return cell
    }
    
}


extension SearchViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tableViewMovie.deselectRow(at: indexPath, animated: true)
    }
}

