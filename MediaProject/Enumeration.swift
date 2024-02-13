//
//  Enumeration.swift
//  MediaProject
//
//  Created by 남현정 on 2024/02/04.
//

import UIKit

enum Custom {
    enum Color {
        static let PointColor: UIColor = .systemTeal // 그냥 미리 만들어봄
        static let TitleColor: UIColor = .white
        static let lableColor: UIColor = .systemGray5
        static let placeholderColor: UIColor = .systemGray2
        static let backgroundColor: UIColor = .black
    }
    
    enum ImageStyle {
        static let person = UIImage(systemName: "person.fill")
        static let navigationItemCheck = UIImage(systemName: "checkmark")
    }
}

enum CustomError {
    case failedRequest // 요청이 아예 실패
    case noData
    case noResponse
    case invalidResponse
    case invalidData
}
