//
//  Enumeration.swift
//  MediaProject
//
//  Created by 남현정 on 2024/02/04.
//

import UIKit

enum Color {
    static let PointColor: UIColor = .systemTeal // 그냥 미리 만들어봄
    static let TitleColor: UIColor = .white
    static let lableColor: UIColor = .systemGray5
    static let backgroundColor: UIColor = .black
}


enum CustomError {
    case failedRequest // 요청이 아예 실패
    case noData
    case noResponse
    case invalidResponse
    case invalidData
}
