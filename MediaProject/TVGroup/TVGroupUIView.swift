//
//  TVGroupUIView.swift
//  MediaProject
//
//  Created by 남현정 on 2024/02/04.
//

import UIKit

class TVGroupUIView: BaseUIView {
    
    let groupTitleLabel = TVGroupLabel()
    
    let tableView: UITableView = {
        let view = UITableView()
        view.backgroundColor = Color.backgroundColor
        view.rowHeight = 180
        view.register(SearchTableViewCell.self, forCellReuseIdentifier: "SearchTableViewCell")
        
        return view
    }()
    
    // BaseUIView
    override func configureHierarchy() {
        addSubview(tableView)
    }

    override func configureConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(safeAreaLayoutGuide)
        }
    }
}
