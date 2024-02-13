//
//  TVOverViewModel.swift
//  MediaProject
//
//  Created by 남현정 on 2024/02/01.
//

import Foundation

/// overview가 있어야 하는 할 때 사용하는 모델
struct TVDetailModel: Decodable {
    let id: Int
    let name: String
    let overview: String
    let posterImage: String
    let popularity: Double
    let backdrop_path: String
    let homepageUrl: String
    let episodeNumber: Int // 에피소드 갯수
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "original_name"
        case overview
        case posterImage = "poster_path"
        case popularity
        case backdrop_path
        case homepageUrl = "homepage"
        case episodeNumber = "number_of_episodes"
    }
}
