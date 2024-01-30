//
//  TVTrendModel.swift
//  MediaProject
//
//  Created by 남현정 on 2024/01/30.
//

import Foundation

struct TVTrendModel: Decodable {
    let results: [Trend]
}

struct Trend: Decodable {
    let backdrop_path: String
    let name: String
    let overview: String
    let posterImage: String
    let popularity: Double
    
    enum CodingKeys: String, CodingKey {
        case backdrop_path
        case name = "original_name"
        case overview
        case posterImage = "poster_path"
        case popularity
    }
}
