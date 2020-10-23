//
//  movieModel.swift
//  MovieApp
//
//  Created by sayali on 22/10/20.
//  Copyright © 2020 sayali. All rights reserved.
//

import Foundation

struct movieModel : Decodable {
    var results  : [results]
    
    var model: movieDataModel {
        return movieDataModel(poster_path: results.first?.poster_path ?? "", title: results.first?.title ?? "")
       }
}

struct results : Decodable {
    var poster_path : String
    var title: String
}

struct movieDataModel {

let poster_path: String
let title: String
}
