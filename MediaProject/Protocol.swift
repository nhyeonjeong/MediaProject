//
//  Protocol.swift
//  MediaProject
//
//  Created by 남현정 on 2024/02/03.
//

import Foundation

//  ViewCon이나 여러 뷰들에 공통적으로 구성되는 함수들 > 프로토콜
protocol Configure {
    func configureHierarchy()
    func configureConstraints()
    func configureView()
}
