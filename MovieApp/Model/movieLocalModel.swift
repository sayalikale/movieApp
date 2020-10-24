//
//  movieLocalModel.swift
//  MovieApp
//
//  Created by sayali on 23/10/20.
//  Copyright © 2020 sayali. All rights reserved.
//

import Foundation
import RealmSwift

class movieLocalModel: Object {
    @objc dynamic var poster_path: String = ""
    @objc dynamic var title: String = ""
    @objc dynamic var check : Bool = false
}
