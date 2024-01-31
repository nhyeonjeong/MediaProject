//
//  TVPopularModel.swift
//  MediaProject
//
//  Created by 남현정 on 2024/01/30.
//

import Foundation

struct TVPopularModel: Decodable {
    let results: [Popular]
}

struct Popular: Decodable {
    let name: String
    let overview: String
    let popularity: Double
    let posterImage: String? // 여기가 nil일수도 있었다..
    let backdrop: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "original_name"
        case overview
        case popularity
        case posterImage = "poster_path"
        case backdrop = "backdrop_path"
    }
}
