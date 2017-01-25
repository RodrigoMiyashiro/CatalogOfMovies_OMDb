//
//  TextField.swift
//  CatalogOfMovies_OMDb
//
//  Created by Rodrigo A E Miyashiro on 22/01/17.
//  Copyright © 2017 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

extension SearchViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        
        return true
    }
}
