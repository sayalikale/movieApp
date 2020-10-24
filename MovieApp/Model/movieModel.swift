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
}

struct results : Decodable {
    var poster_path : String
    var title: String
}

