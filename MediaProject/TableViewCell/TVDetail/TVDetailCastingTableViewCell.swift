//
//  TVDetailCastingTableViewCell.swift
//  MediaProject
//
//  Created by 남현정 on 2024/02/03.
//

import UIKit

class TVDetailCastingTableViewCell: UITableViewCell {
    
    let groupTitle = TVGroupLabel()

    let collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: TVDetailCastingTableViewCell.configureCollectionViewLayout())
        
        view.backgroundColor = Color.backgroundColor
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = Color.backgroundColor
        
        configureHierarchy()
        configureContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension TVDetailCastingTableViewCell {
    func configureHierarchy() {
        contentView.addSubview(groupTitle)
        contentView.addSubview(collectionView)
    }
    
    func configureContraints() {
        groupTitle.snp.makeConstraints { make in
            make.top.leading.equalTo(contentView).inset(10)
            make.height.equalTo(20)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(groupTitle.snp.bottom).offset(10)
            make.horizontalEdges.bottom.equalTo(contentView)
            make.height.equalTo(150) // 왜 이걸 써야하지 밑에서 configureCollectionViewLayout을 해주는데?
        }
    }
    
    static func configureCollectionViewLayout() -> UICollectionViewFlowLayout {
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 80, height: 150) // 추천 드라마 셀의 크기
        layout.minimumLineSpacing = 30
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)

        layout.scrollDirection = .horizontal
        return layout
    }

}
