//
//  PosterImageView.swift
//  MediaProject
//
//  Created by 남현정 on 2024/02/04.
//

import UIKit

/// TV 포스터 이미지
class PosterImageView: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureView() {
        contentMode = .scaleAspectFill
        layer.cornerRadius = 10
        clipsToBounds = true
    }
}
