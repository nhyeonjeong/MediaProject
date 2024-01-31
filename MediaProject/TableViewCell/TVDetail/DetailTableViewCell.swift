//
//  DetailTableViewCell.swift
//  MediaProject
//
//  Created by 남현정 on 2024/01/31.
//

import UIKit
import SnapKit

class DetailTableViewCell: UITableViewCell {
    
    let groupTitle = UILabel()
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero
                                              , collectionViewLayout: DetailTableViewCell.configureCollectionViewLayout())
        collectionView.backgroundColor = .black
        
//        collectionView.delegate = self
//        collectionView.dataSource = self
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureHierarchy()
        configureConstraints()
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}

extension DetailTableViewCell {
    
    func configureHierarchy() {
        contentView.addSubview(groupTitle)
        contentView.addSubview(collectionView)
    }
    
    func configureConstraints() {
        groupTitle.snp.makeConstraints { make in
            make.top.leading.equalTo(contentView).inset(10)
            make.height.equalTo(22)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(groupTitle.snp.bottom).inset(4)
            make.horizontalEdges.bottom.equalTo(contentView).inset(10)
        }
    }
    
    func configureView() {
        groupTitle.font = .boldSystemFont(ofSize: 15)
        groupTitle.textColor = .red
    }
    
    static func configureCollectionViewLayout() -> UICollectionViewFlowLayout {
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 130, height: 180)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)

        layout.scrollDirection = .horizontal
        return layout
    }
    
}

