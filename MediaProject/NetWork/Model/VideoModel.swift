//
//  VideoModel.swift
//  MediaProject
//
//  Created by 남현정 on 2024/02/14.
//

import Foundation

struct VideoModel: Decodable {
//    let id: Int
    let results: [VideoResults]
}

struct VideoResults: Decodable {
    let name: String
    let key: String // youtube website
}
