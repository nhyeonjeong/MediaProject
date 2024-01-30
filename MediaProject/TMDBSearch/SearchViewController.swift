//
//  SearchViewController.swift
//  MediaProject
//
//  Created by 남현정 on 2024/01/30.
//

import UIKit
import SnapKit
import Kingfisher

class SearchViewController: UIViewController {
    // 섹션에 해보기
    let tableView = UITableView()
    /// 섹션에 나올 타이틀
    let sectionTitleList = ["TV Trend", "TV TopRated", "TV Popular"]
    var trendList: [Result] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureHierarchy()
        configureConstraints()
        configureView()
        
        configureTableView()
        
        fetchTMDB()
    }
    
    func fetchTMDB() {
        TMDBAPIManager.shared.fetchTVTrend { results in
            self.trendList = results
            self.tableView.reloadData()
            
        }
    }
}

extension SearchViewController {
    func configureHierarchy() {
        view.addSubview(tableView)
    }
    
    func configureView() {
        tableView.backgroundColor = .red
        

    }
    
    func configureConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func configureTableView() {
        tableView.rowHeight = 180
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(SearchTableViewCell.self, forCellReuseIdentifier: "SearchTableViewCell")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitleList.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitleList[section]
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 // 섹션마다 셀은 한 개
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as! SearchTableViewCell
        
        cell.collectionView.delegate = self
        cell.collectionView.dataSource = self
        cell.collectionView.reloadData() // api통신후 tableview를 갱신하면서 collectionview도 갱신해야한다.
        
        return cell
    }
    
}

extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return trendList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCollectionViewCell", for: indexPath) as! SearchCollectionViewCell
        
        if indexPath.section == 0 {
            let item = trendList[indexPath.item]
            let url = URL(string: "https://image.tmdb.org/t/p/w500\(item.posterImage)")
            cell.posterImageView.kf.setImage(with: url, placeholder: UIImage(systemName: "star.fill"))
            
            return cell
            
        } else if indexPath.section == 1 {
            let item = trendList[indexPath.item]
            let url = URL(string: "https://image.tmdb.org/t/p/w500\(item.posterImage)")
            cell.posterImageView.kf.setImage(with: url, placeholder: UIImage(systemName: "star.fill"))
            
            return cell
        } else if indexPath.section == 2 {
            let item = trendList[indexPath.item]
            let url = URL(string: "https://image.tmdb.org/t/p/w500\(item.posterImage)")
            cell.posterImageView.kf.setImage(with: url, placeholder: UIImage(systemName: "star.fill"))
            
            return cell
        } else {
            return cell
        }
    }
    
    
}
