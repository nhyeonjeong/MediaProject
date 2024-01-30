//
//  SearchCollectionViewCell.swift
//  MediaProject
//
//  Created by 남현정 on 2024/01/30.
//

import UIKit
import SnapKit

class SearchCollectionViewCell: UICollectionViewCell {
    
    let posterImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureHierarchy()
        configureConstraints()
        configureView()
        
    }
    
    func configureHierarchy() {
        contentView.addSubview(posterImageView)
    }
    
    func configureConstraints() {
        posterImageView.snp.makeConstraints { make in
            make.edges.equalTo(contentView).inset(10)
        }
    }
    
    func configureView() {
        posterImageView.contentMode = .scaleAspectFill
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


