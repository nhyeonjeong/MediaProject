//
//  DetailViewController.swift
//  MediaProject
//
//  Created by 남현정 on 2024/01/31.
//

import UIKit
import SnapKit

class DetailViewController: UIViewController {
    
    lazy var tvTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .black
        
        tableView.register(DetailTableViewCell.self, forCellReuseIdentifier: "DetailTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        
        return tableView
    }()

    let list = ["tv정보", "비슷한 콘텐츠 추천", "캐스팅 정보"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarchy()
        configureConstraints()
    }
    
}

extension DetailViewController {
    func configureHierarchy() {
        view.addSubview(tvTableView)
    }
    
    func configureConstraints() {
        tvTableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
            
        }
    }
}


extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailTableViewCell", for: indexPath) as! DetailTableViewCell
        
        return cell
    }
    
    
}

//extension DetailTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 10
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "", for: indexPath)
//    }
//    
//    
//    
//}

