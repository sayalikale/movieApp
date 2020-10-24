//
//  movieManager.swift
//  MovieApp
//
//  Created by sayali on 22/10/20.
//  Copyright © 2020 sayali. All rights reserved.
//https://image.tmdb.org/t/p/h100/7D430eqZj8y3oVkLFfsWXGRcpEG.jpg

import Foundation
import Alamofire

enum WeatherError: Error, LocalizedError {
    
    case unknown
    case invalidApiKey
    case custom(description: String)
    
    var errorDescription: String? {
        switch self {
        case .invalidApiKey:
            return "Invalid API key: You must be granted a valid key"
        case .unknown:
            return "Hey, this is an unknown error!"
        case .custom(let description):
            return description
        }
    }
    
}

struct movieManager {
    
    private let API_KEY = "7bfe007798875393b05c5aa1ba26323e"
    
    
    func fetchWeather(completion: @escaping (Result<movieModel, Error>) -> Void) {
        let path = "https://api.themoviedb.org/3/movie/now_playing?api_key=%@&language=en-US&page=1"
        let urlString = String(format: path, API_KEY)
        handleRequest(urlString: urlString, completion: completion)
    }

    private func handleRequest(urlString: String, completion: @escaping (Result<movieModel, Error>) -> Void) {
        
        AF.request(urlString)
            .validate()
            .responseDecodable(of: movieModel.self, queue: .main, decoder: JSONDecoder()) { (response) in
            switch response.result {
            case .success(let movieModel):
                let model = movieModel
                completion(.success(model))
            case .failure(let error):
                if let err = self.getMovieError(error: error, data: response.data) {
                    completion(.failure(err))
                } else {
                    completion(.failure(error))
                }
            }
        }
    }
    
    private func getMovieError(error: AFError, data: Data?) -> Error? {
        if error.responseCode == 7,
            let data = data,
            let failure = try? JSONDecoder().decode(MovieDataFailure.self, from: data) {
            let message = failure.message
            return WeatherError.custom(description: message)
        } else {
            return nil
        }
    }
    
}

