//
//  ProfileSettingUIView.swift
//  MediaProject
//
//  Created by 남현정 on 2024/02/14.
//

import UIKit
import SnapKit

class ProfileSettingUIView: BaseUIView {
    
    let searchBar = UISearchBar()

    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout())
    
    override func configureHierarchy() {
        addSubview(searchBar)
        addSubview(collectionView)
    }
    
    override func configureConstraints() {
        searchBar.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(safeAreaLayoutGuide)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(10)
            make.leading.trailing.bottom.equalTo(safeAreaLayoutGuide)
        }
    }
    
    override func configureView() {
        searchBar.backgroundColor = Custom.Color.backgroundColor
        collectionView.backgroundColor = .clear
    }
}

extension ProfileSettingUIView {
    func collectionViewLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 120, height: 160) // 없으면 안됨
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        layout.scrollDirection = .horizontal // 스크롤 방향도 FlowLayout에 속한다 -> contentMode때문에 Fill로
        return layout
    }
}
