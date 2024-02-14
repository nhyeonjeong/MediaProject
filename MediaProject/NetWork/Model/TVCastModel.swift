//
//  TVCastModel.swift
//  MediaProject
//
//  Created by 남현정 on 2024/02/01.
//

import Foundation

// 캐스팅 정보
struct TVCastModel: Decodable {
    let cast: [TVCast]
}

struct TVCast: Decodable {
    let name: String // 배우 이름
    let popularity: Double
    let profile: String
    let roles: [Role] // 배역 이름
    
    enum CodingKeys: String, CodingKey {
        case name
        case popularity
        case profile = "profile_path"
        case roles
    }
}

struct Role: Decodable {
    let characterName: String
    
    enum CodingKeys: String, CodingKey {
        case characterName = "character"
    }
}
