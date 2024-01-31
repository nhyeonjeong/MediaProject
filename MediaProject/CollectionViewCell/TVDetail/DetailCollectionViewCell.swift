//
//  DetailCollectionViewCell.swift
//  MediaProject
//
//  Created by 남현정 on 2024/01/31.
//

import UIKit

class DetailCollectionViewCell: UICollectionViewCell {
    
    let titleLabel = UILabel()
    let posterImageView = UIImageView(frame: .zero)
    let overviewLabel = UILabel()
    let numberOfEpisodesLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureHierarchy()
        configureConstraints()
        configureView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension DetailCollectionViewCell {
    
    func configureHierarchy() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(posterImageView)
        contentView.addSubview(overviewLabel)
        contentView.addSubview(numberOfEpisodesLabel)
    }
    
    func configureConstraints() {
        titleLabel.snp.makeConstraints { make in
//            make.
        }
    }
    
    func configureView() {
        
    }
}
