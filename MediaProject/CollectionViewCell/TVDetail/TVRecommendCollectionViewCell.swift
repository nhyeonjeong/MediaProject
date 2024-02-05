//
//  DetailCollectionViewCell.swift
//  MediaProject
//
//  Created by 남현정 on 2024/01/31.
//

import UIKit

// 비슷한 드라마 추천 화면
class TVRecommendCollectionViewCell: UICollectionViewCell {
    
    let posterImageView = PosterImageView(frame: .zero)
    
    let titleLabel: UILabel = {
       let view = UILabel()
        view.textAlignment = .center
        view.font = .boldSystemFont(ofSize: 13)
        view.textColor = Color.lableColor
        view.numberOfLines = 2
        view.backgroundColor = .clear
        return view
    }() // 드라마 제목
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .clear
        self.backgroundColor = .clear
        
        configureHierarchy()
        configureConstraints()
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
            make.top.equalTo(posterImageView.snp.bottom).offset(8) // inset이 아니고 offset이구나..! 이해 완. offset이 원하는 만큼 안나오는 이유? offset(4) titleLabel이 가려짐 > 내가 높이를 제대로 안 준거였음ㅋ
            make.horizontalEdges.equalTo(contentView)
            
        
        }
    }
}
