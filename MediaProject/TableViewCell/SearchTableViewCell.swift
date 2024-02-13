//
//  SearchTableViewCell.swift
//  MediaProject
//
//  Created by 남현정 on 2024/01/30.
//

import UIKit
import SnapKit

class SearchTableViewCell: UITableViewCell {

    let groupTitle = TVGroupLabel()
    
    let collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: SearchTableViewCell.configureCollectionViewLayout())
        view.backgroundColor = Custom.Color.backgroundColor
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = Custom.Color.backgroundColor
        
        configureHierarchy()
        configureConstraints()
        configureView()
    }
    
    func configureHierarchy() {
        contentView.addSubview(groupTitle)
        contentView.addSubview(collectionView)
    }
    
    func configureConstraints() {
        groupTitle.snp.makeConstraints { make in
            make.top.leading.equalTo(contentView).inset(10)
            make.height.equalTo(20)
        }
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(groupTitle.snp.bottom).offset(4)
            make.horizontalEdges.equalTo(contentView)
            make.bottom.equalTo(contentView).inset(10)
//            make.height.equalTo(self.collectionHeight) // 여기는 높이 안써줘도 된다.
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
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)

        layout.scrollDirection = .horizontal
        return layout
    }

}


