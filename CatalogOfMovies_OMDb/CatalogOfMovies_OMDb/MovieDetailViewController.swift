//
//  MovieDetailViewController.swift
//  CatalogOfMovies_OMDb
//
//  Created by Rodrigo A E Miyashiro on 23/01/17.
//  Copyright © 2017 Rodrigo Miyashiro. All rights reserved.
//

import UIKit
import CoreData

class MovieDetailViewController: UIViewController {
    
    // MARK: - Lets and Vars
    var movie = Movie()
    
    
    // MARK: - IBOutlets
    @IBOutlet weak var imgPosterBackground: UIImageView!
    @IBOutlet weak var imgPoster: UIImageView!
    @IBOutlet weak var lblMovieName: UILabel!
    @IBOutlet weak var lblMovieGenre: UILabel!
    @IBOutlet weak var lblMovieDirector: UILabel!
    @IBOutlet weak var lblMovieYear: UILabel!
    @IBOutlet weak var lblMoviePlot: UILabel!
    @IBOutlet weak var lblMovieWriter: UILabel!
    @IBOutlet weak var lblMovieActors: UILabel!
    @IBOutlet weak var lblMovieAwards: UILabel!
    @IBOutlet weak var lblMovieRuntime: UILabel!
    @IBOutlet weak var barBtnItemFavorite: UIBarButtonItem!
    
    
    // MARK: - Life Cycle
    override func viewDidLoad()
    {
        super.viewDidLoad()

        configNavigationBar()
        loadMovie()
    }
    
    func configNavigationBar()
    {
        self.title = movie.title
    }

    
    func loadMovie()
    {
        imgPoster.layer.borderWidth = 1
        imgPoster.layer.borderColor = UIColor.white.cgColor
        
        if movie.poster.0 == ""
        {
            imgPoster.image = UIImage(data: movie.poster.1 as Data)
            imgPosterBackground.image = UIImage(data: movie.poster.1 as Data)
        }
        else
        {
            loadImgMovie(urlImg: movie.poster.0)
            
        }
        
        lblMovieName.text = movie.title
        lblMovieGenre.text = movie.genre
        lblMovieDirector.text = movie.director
        lblMovieYear.text = movie.year
        lblMovieRuntime.text = movie.runtime
        lblMoviePlot.text = movie.plot
        lblMovieWriter.text = movie.writer
        lblMovieActors.text = movie.actors
        lblMovieAwards.text = movie.awards
    }
    
    // TODO: - Até o momento da entrega não tinham liberado o acesso a API Poster.
    func loadPoster_(imdbID: String)
    {
        // http://img.omdbapi.com/?i=tt2294629&apikey=d0504535
        let url = "http://img.omdbapi.com/?i=\(imdbID)&apikey=d0504535"
        print("URL: \(url)")
        Request.getImage(url: url) { (imgData) in
            self.imgPosterBackground.image = UIImage(data: imgData)
        }
    }
    

    
    func loadImgMovie(urlImg: String)
    {
        Request.getImage(url: urlImg) { (imgData) in
            self.imgPoster.image = UIImage(data: imgData)
            self.imgPosterBackground.image = UIImage(data: imgData)
        }
    }
    
    @IBAction func addOrRemoveFavorite(_ sender: UIBarButtonItem)
    {
        let img = barBtnItemFavorite.image
        
        if img == UIImage(named: "Star")
        {
            barBtnItemFavorite.image = UIImage(named: "Star Filled")
            MovieDAO.saveItem(movie: movie, imgMovie: imgPoster.image!)
            
        }
        else
        {
            barBtnItemFavorite.image = UIImage(named: "Star")
            MovieDAO.removeMovie(movie: movie)
        }
    }    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
