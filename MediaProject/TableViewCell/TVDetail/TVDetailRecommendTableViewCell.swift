//
//  DetailTableViewCell.swift
//  MediaProject
//
//  Created by 남현정 on 2024/01/31.
//

import UIKit
import SnapKit

class TVDetailRecommendTableViewCell: UITableViewCell {
    
    let groupTitle = TVGroupLabel()
    
//    var collectionWidth: Int = 0 // 130
//    var collectionHeight: Int = 0 // 230
    
    lazy var collectionView: UICollectionView = {
        var view = UICollectionView(frame: .zero, collectionViewLayout: configureCollectionViewLayout())
//        DispatchQueue.main.async {
//            print("선언부 collectionView", self.collectionWidth, self.collectionHeight)
//            view = UICollectionView(frame: .zero, collectionViewLayout: TVDetailRecommendTableViewCell.configureCollectionViewLayout(width: self.collectionWidth, height: self.collectionHeight))
            
//        }
        view.backgroundColor = .clear
//        backgroundColor = .blue
        return view
        
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .clear
//        self.backgroundColor = .gray // 26번쨰 줄의 blue와 겹친다
        self.backgroundColor = .clear
        
//        print(#function, collectionHeight)
        configureHierarchy()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension TVDetailRecommendTableViewCell {
    
    func configureHierarchy() {
        contentView.addSubview(groupTitle)
        contentView.addSubview(collectionView)
    }
    
    func configureConstraints() {
        groupTitle.snp.makeConstraints { make in
            make.top.leading.equalTo(contentView).inset(10)
            make.height.equalTo(20)
        }

//        DispatchQueue.main.async {
//        print(#function, self.collectionHeight)
        self.collectionView.snp.makeConstraints { make in
            make.top.equalTo(self.groupTitle.snp.bottom).offset(10)
            make.horizontalEdges.bottom.equalTo(self.contentView)
            make.height.equalTo(230) // 230 // dimension후에 왜 이걸 써야하지 밑에서 configureCollectionViewLayout을 해주는데?
        }
//        }
    }
    
    func configureCollectionViewLayout() -> UICollectionViewFlowLayout {
//        print(#function, width, height)
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 130, height: 230) // 추천 드라마 셀의 크기
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)

        layout.scrollDirection = .horizontal
        return layout
    }
}

