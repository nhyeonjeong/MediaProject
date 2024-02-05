//
//  TVDetailCastingCollectionViewCell.swift
//  MediaProject
//
//  Created by 남현정 on 2024/02/03.
//

import UIKit

class TVDetailCastingCollectionViewCell: UICollectionViewCell {
    let actressImageView = UIImageView(frame: .zero)
    let actressNameLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .clear
        

        configureHierarchy()
        configureContraints()
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TVDetailCastingCollectionViewCell {
    func configureHierarchy() {
        contentView.addSubview(actressImageView)
        contentView.addSubview(actressNameLabel)
    }
    
    func configureContraints() {
        actressImageView.snp.makeConstraints { make in
            make.top.equalTo(contentView).inset(10)
            make.horizontalEdges.equalTo(contentView)
            make.size.equalTo(80)//계산해줌
        }
        
        actressNameLabel.snp.makeConstraints { make in
            make.top.equalTo(actressImageView.snp.bottom).offset(8)
            make.horizontalEdges.equalTo(contentView)
            
        }
    }
    
    func configureView() {
        actressImageView.contentMode = .scaleAspectFill
        actressImageView.layer.cornerRadius = 40
        actressImageView.clipsToBounds = true
        
        actressNameLabel.textColor = Color.lableColor
        actressNameLabel.font = .systemFont(ofSize: 15)
        actressNameLabel.textAlignment = .center
        actressNameLabel.numberOfLines = 2
        actressNameLabel.backgroundColor = .clear
    }
    
}
