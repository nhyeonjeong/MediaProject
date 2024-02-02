//
//  DetailCollectionViewCell.swift
//  MediaProject
//
//  Created by 남현정 on 2024/01/31.
//

import UIKit

// 비슷한 드라마 추천 화면
class TVRecommendCollectionViewCell: UICollectionViewCell {
    
    let titleLabel: UILabel = {
       let view = UILabel()
        view.textAlignment = .center
        view.font = .boldSystemFont(ofSize: 13)
        view.textColor = .systemGray5
        view.numberOfLines = 2
//        view.backgroundColor = .systemPink
        return view
    }() // 드라마 제목
    
    let posterImageView: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .black
        
        configureHierarchy()
        configureConstraints()
        configureView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension TVRecommendCollectionViewCell {
    
    func configureHierarchy() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(posterImageView)
 
    }
    
    func configureConstraints() {
        posterImageView.snp.makeConstraints { make in
            make.horizontalEdges.top.equalTo(contentView)
            make.height.equalTo(180)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(posterImageView.snp.bottom).offset(8) // inset이 아니고 offset이구나..! 이해 완.
            make.horizontalEdges.equalTo(contentView)
            
        
        }
    }
    
    func configureView() {
        
    }
}
