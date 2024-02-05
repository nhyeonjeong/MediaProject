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
        tableView.backgroundColor = .clear // 여기까지는 clear잘 먹는듯?
        // 추천 테이블뷰셀
        tableView.register(TVDetailRecommendTableViewCell.self, forCellReuseIdentifier: TVDetailRecommendTableViewCell.identifier)
        // 드라마 디테일 테이블뷰셀
        tableView.register(TVDetailTableViewCell.self, forCellReuseIdentifier: TVDetailTableViewCell.identifier)
        // 드라마 캐스팅 정보 테이블뷰셀
        tableView.register(TVDetailCastingTableViewCell.self, forCellReuseIdentifier: TVDetailCastingTableViewCell.identifier)
        
//        tableView.rowHeight = 280
        tableView.rowHeight = UITableView.automaticDimension // 유동적으로 높이 늘어나도록
        tableView.estimatedRowHeight = 50 // 처음에 높이를 대략 잡아줄 때 사용한다.(나중에 달라지더라도) / 0으로 잡아주는 것보다 대략잡아주는게 더 좋다. 늘어날게 줄어들수록 좋은거임
        
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
