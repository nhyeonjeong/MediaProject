//
//  TVTopRatedModel.swift
//  MediaProject
//
//  Created by 남현정 on 2024/01/30.
//

import Foundation

struct TVTopRatedModel: Decodable {
    let results: [TopRated]
}

struct TopRated: Decodable {
    let name: String
    let overview: String
    let popularity: Double
    let posterImage: String
    
    enum CodingKeys: String, CodingKey {
        case name = "original_name"
        case overview
        case popularity
        case posterImage = "poster_path"
    }
}
