//
//  MovieDAO.swift
//  CatalogOfMovies_OMDb
//
//  Created by Rodrigo A E Miyashiro on 24/01/17.
//  Copyright © 2017 Rodrigo Miyashiro. All rights reserved.
//

import UIKit
import CoreData

class MovieDAO: UIViewController {
    
    private static func context() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        
        return managedContext
    }
    
    static func loadingMovies (completion: @escaping (_ result: [Movie])->())
    {
        let managedContext = context()
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "MovieEntity")
        fetchRequest.returnsObjectsAsFaults = false
        
        var movies = [Movie]()
        
        do
        {
            let result = try managedContext.fetch(fetchRequest)
            if result.count > 0
            {
                for movie in result as! [NSManagedObject]
                {
                    let newMovie = Movie()
                    newMovie.actors     = movie.value(forKey: "actors")     as! String
                    newMovie.awards     = movie.value(forKey: "awards")     as! String
                    newMovie.country    = movie.value(forKey: "country")    as! String
                    newMovie.director   = movie.value(forKey: "director")   as! String
                    newMovie.genre      = movie.value(forKey: "genre")      as! String
                    newMovie.imdbID     = movie.value(forKey: "imdbID")     as! String
                    newMovie.imdbRating = movie.value(forKey: "imdbRating") as! String
                    newMovie.imdbVotes  = movie.value(forKey: "imdbVotes")  as! String
                    newMovie.language   = movie.value(forKey: "language")   as! String
                    newMovie.metascore  = movie.value(forKey: "metascore")  as! String
                    newMovie.plot       = movie.value(forKey: "plot")       as! String
                    newMovie.released   = movie.value(forKey: "released")   as! String
                    newMovie.response   = movie.value(forKey: "response")   as! String
                    newMovie.runtime    = movie.value(forKey: "runtime")    as! String
                    newMovie.title      = movie.value(forKey: "title")      as! String
                    newMovie.type       = movie.value(forKey: "type")       as! String
                    newMovie.writer     = movie.value(forKey: "writer")     as! String
                    newMovie.year       = movie.value(forKey: "year")       as! String
                    newMovie.poster     = ("", movie.value(forKey: "imgMovie") as! NSData)
                    
                    movies.append(newMovie)
                }
                completion(movies)
            }
        }
        catch
        {
            print("Error...")
        }
    }
    
    static func saveItem(movie: Movie, imgMovie: UIImage)
    {
        let managedContext = context()
        let entity = NSEntityDescription.entity(forEntityName: "MovieEntity", in: managedContext)
        let item = NSManagedObject(entity: entity!, insertInto: managedContext)
        
        item.setValue(true, forKey: "favorite")
        item.setValue(movie.title, forKey: "title")
        item.setValue(movie.genre, forKey: "genre")
        item.setValue(movie.actors, forKey: "actors")
        item.setValue(movie.awards, forKey: "awards")
        item.setValue(movie.country, forKey: "country")
        item.setValue(movie.director, forKey: "director")
        item.setValue(movie.imdbID, forKey: "imdbID")
        item.setValue(movie.imdbRating, forKey: "imdbRating")
        item.setValue(movie.imdbVotes, forKey: "ImdbVotes")
        item.setValue(movie.language, forKey: "language")
        item.setValue(movie.metascore, forKey: "metascore")
        item.setValue(movie.plot, forKey: "plot")
        item.setValue(movie.released, forKey: "released")
        item.setValue(movie.response, forKey: "response")
        item.setValue(movie.runtime, forKey: "runtime")
        item.setValue(movie.type, forKey: "type")
        item.setValue(movie.writer, forKey: "writer")
        item.setValue(movie.year, forKey: "year")
        item.setValue(UIImagePNGRepresentation(imgMovie), forKey: "imgMovie")
        item.setValue(NSData(), forKey: "poster")
        
        do
        {
            try managedContext.save()
            print("Salvando....")
        }
        catch
        {
            print("Erro ao salvar dados...")
        }
    }
    
    static func removeMovie(movie: Movie)
    {
        let managedContext = context()
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "MovieEntity")
        if let fetchResults = try!managedContext.fetch(fetchRequest) as? [NSManagedObject]
        {
            for x in 0..<fetchResults.count
            {
                if (fetchResults[x].value(forKey: "imdbID") as! String) == movie.imdbID
                {
                    managedContext.delete(fetchResults[x] as NSManagedObject)
                    try!managedContext.save()
                }
            }
        }
    }
}
