//
//  FavoriteMoviesViewController.swift
//  CatalogOfMovies_OMDb
//
//  Created by Rodrigo A E Miyashiro on 23/01/17.
//  Copyright © 2017 Rodrigo Miyashiro. All rights reserved.
//

import UIKit
import CoreData

class FavoriteMoviesViewController: UIViewController {
    
    // MARK: - Lets and Vars
    var moviesFavorites = [Movie]()
    
    
    // MARK: - IBOutlets
    @IBOutlet weak var collectionViewMovie: UICollectionView!
    
    
    // MARK: - Life Cycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let imgBackground = UIImage(named: "bg_movies")
        let imgViewBackground = UIImageView(image: imgBackground)
//        imgViewBackground.contentMode = .scaleAspectFill
        
        collectionViewMovie.backgroundView = imgViewBackground

        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        self.title = "Meus Filmes Favoritos"
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        
        moviesFavorites = [Movie]()
        loadingMoviesFromCoreData()
    }
    
    
    func loadingMoviesFromCoreData()
    {
        MovieDAO.loadingMovies { (movies) in
            self.moviesFavorites = [Movie]()
            self.moviesFavorites = movies
            self.collectionViewMovie.reloadData()
        }
    }
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "segueFavoriteDetail"
        {
            navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
            
            let index = collectionViewMovie.indexPathsForSelectedItems

            let nextView = segue.destination as! MovieDetailViewController
            nextView.movie = moviesFavorites[(index?[0].item)!]
            nextView.barBtnItemFavorite.image = UIImage(named: "Star Filled")
        }
    }
}
