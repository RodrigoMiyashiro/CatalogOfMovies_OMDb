//
//  SearchViewController.swift
//  CatalogOfMovies_OMDb
//
//  Created by Rodrigo A E Miyashiro on 22/01/17.
//  Copyright © 2017 Rodrigo Miyashiro. All rights reserved.
//

import UIKit
import JSONJoy

class SearchViewController: UIViewController {
    
    // MARK: - Lets and Vars
    var movies = [Movie]()
    
    
    // MARK: - IBOutlets
    @IBOutlet weak var txtFieldMovieName: UITextField!
    @IBOutlet weak var tableViewMovie: UITableView!
    @IBOutlet weak var btnSearch: UIButton!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    
    
    // MARK: - Life Cycle
    override func viewDidLoad()
    {
        super.viewDidLoad()

        self.title = "Encontre seus filmes"
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        btnSearch.layer.cornerRadius = 4
    }
    
    
    // MARK: - IBAction
    @IBAction func search(_ sender: UIButton)
    {
        spinner.startAnimating()
        var title = txtFieldMovieName.text
        title = title?.replacingOccurrences(of: " ", with: "+")
        searchMovie(name: title!)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        txtFieldMovieName.resignFirstResponder()
    }
    
    
    func searchMovie(name: String)
    {
        let url = "http://www.omdbapi.com/?t=\(name)&y=&plot=short&r=json" //"http://www.omdbapi.com/?"
        Request.get(url: url) { (data) in
            do
            {
                let movie = try Movie(JSONDecoder(data))
                self.movies = [Movie]()
                self.movies.append(movie)
            }
            catch
            {
                print("Error... \(JSONError.wrongType)")
            }
            self.tableViewMovie.reloadData()
            self.spinner.stopAnimating()
        }
    }

    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "segueSearchDetail"
        {
            navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
            
            let index = self.tableViewMovie.indexPathForSelectedRow
            
            let nextView = segue.destination as! MovieDetailViewController
            nextView.movie = movies[(index?.row)!]
        }
    }
}

