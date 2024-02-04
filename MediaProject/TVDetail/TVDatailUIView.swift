//
//  TVDatailUIView.swift
//  MediaProject
//
//  Created by 남현정 on 2024/02/03.
//

import UIKit

class TVDatailUIView: BaseUIView {

    // init구문은 BaseUIView에서 실행될 것이기 때문에 쓰지 않아도 된다.'
    
    lazy var tvTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = Color.backgroundColor
        // 추천 테이블뷰셀
        tableView.register(TVDetailRecommendTableViewCell.self, forCellReuseIdentifier: "TVDetailRecommendTableViewCell")
        // 드라마 디테일 테이블뷰셀
        tableView.register(TVDetailTableViewCell.self, forCellReuseIdentifier: "TVDetailTableViewCell")
        // 드라마 캐스팅 정보 테이블뷰셀
        tableView.register(TVDetailCastingTableViewCell.self, forCellReuseIdentifier: "TVDetailCastingTableViewCell")
        
//        tableView.rowHeight = 280
        tableView.rowHeight = UITableView.automaticDimension // 유동적으로 높이 늘어나도록
        
        return tableView
    }()
    
    // BaseUIView
    override func configureHierarchy() {
        self.addSubview(tvTableView)
    }
    
    override func configureConstraints() {
        tvTableView.snp.makeConstraints { make in
            make.edges.equalTo(safeAreaLayoutGuide)
            
        }
    }
}
