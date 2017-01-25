//
//  CollectionView.swift
//  CatalogOfMovies_OMDb
//
//  Created by Rodrigo A E Miyashiro on 23/01/17.
//  Copyright © 2017 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

extension FavoriteMoviesViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return self.moviesFavorites.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let CellIdentifier = "idenfitierMovieCollectionCell"
        let cell = collectionViewMovie.dequeueReusableCell(withReuseIdentifier: CellIdentifier, for: indexPath) as! FavoriteMovieCollectionViewCell
        
        let item = indexPath.item
        let movie = moviesFavorites[item]
        
        cell.imgMovie.image = UIImage(data: movie.poster.1 as Data)
        cell.lblMovieName.text = movie.title
        
        return cell
    }
}

extension FavoriteMoviesViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        collectionViewMovie.deselectItem(at: indexPath, animated: true)
    }
}
