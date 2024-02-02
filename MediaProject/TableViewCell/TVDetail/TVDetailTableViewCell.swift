//
//  TVDetailView.swift
//  MediaProject
//
//  Created by 남현정 on 2024/02/02.
//

import UIKit
import SnapKit

class TVDetailTableViewCell: UITableViewCell {
    let groupTitle = UILabel()
    let posterImageVies = UIImageView()
    let titleLabel = UILabel()
    let popularityLabel = UILabel()
    let overviewLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .black
        configureHierarchy()
        configureConstraints()
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension TVDetailTableViewCell {
    func configureHierarchy() {
        contentView.addSubview(groupTitle)
        contentView.addSubview(posterImageVies)
        contentView.addSubview(titleLabel)
        contentView.addSubview(popularityLabel)
        contentView.addSubview(overviewLabel)
    }
    
    func configureConstraints() {
        groupTitle.snp.makeConstraints { make in
            make.top.leading.equalTo(contentView).inset(10)
            make.height.equalTo(20)
        }
        
        posterImageVies.snp.makeConstraints { make in
            make.top.equalTo(groupTitle.snp.bottom).offset(10) // self가 되나???
            make.leading.equalTo(contentView).inset(10)
            make.height.equalTo(180)
            make.width.equalTo(130)
            
        }
        
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(posterImageVies.snp.trailing).offset(10)
            make.top.equalTo(posterImageVies.snp.top)
            make.trailing.equalTo(contentView).inset(10)
//            make.height.equalTo(20)
        }
        
        popularityLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(4)
            make.leading.equalTo(posterImageVies.snp.trailing).offset(10)
            make.trailing.equalTo(contentView).inset(10)
            make.height.equalTo(20)
            
        }
        
        overviewLabel.snp.makeConstraints { make in
            make.top.equalTo(posterImageVies.snp.bottom).offset(8)
//            make.height.eq(20) // UITextView로 했을 때는 높이 안 정해주니까 아예 안나오던데 이유가?
            make.horizontalEdges.bottom.equalTo(contentView).inset(10)
             
        }
    }
    
    func configureView() {
        
        groupTitle.font = .boldSystemFont(ofSize: 18)
        groupTitle.textColor = .white
        
        posterImageVies.contentMode = .scaleAspectFill
        posterImageVies.layer.cornerRadius = 10
        posterImageVies.clipsToBounds = true
        
        titleLabel.textColor = .systemGray5
        titleLabel.font = .boldSystemFont(ofSize: 17)
        titleLabel.numberOfLines = 2
        
        popularityLabel.textColor = .systemGray5
        popularityLabel.font = .systemFont(ofSize: 15)
        
        overviewLabel.textColor = .systemGray5
//        overviewLabel.backgroundColor = .black
        overviewLabel.font = .systemFont(ofSize: 15)
        overviewLabel.numberOfLines = 0
    }
}
