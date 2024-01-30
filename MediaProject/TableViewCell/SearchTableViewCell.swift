//
//  SearchTableViewCell.swift
//  MediaProject
//
//  Created by 남현정 on 2024/01/30.
//

import UIKit
import SnapKit

class SearchTableViewCell: UITableViewCell {

    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: SearchTableViewCell.configureCollectionViewLayout())
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureHierarchy()
        configureConstraints()
        configureView()
    }
    
    func configureHierarchy() {
        contentView.addSubview(collectionView)
    }
    
    func configureConstraints() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
    }
    
    func configureView() {
        
        collectionView.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: "SearchCollectionViewCell")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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


