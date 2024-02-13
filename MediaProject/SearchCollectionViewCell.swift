//
//  SearchCollectionViewCell.swift
//  MediaProject
//
//  Created by 남현정 on 2024/01/30.
//

import UIKit
import SnapKit

class SearchCollectionViewCell: UICollectionViewCell {
    
    let posterImageView = PosterImageView(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = Custom.Color.backgroundColor
        
        configureHierarchy()
        configureConstraints()
    }
    
    func configureHierarchy() {
        contentView.addSubview(posterImageView)
    }
    
    func configureConstraints() {
        posterImageView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


