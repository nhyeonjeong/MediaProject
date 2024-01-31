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
    var trendList: [Trend] = []
    var topRatedList: [TopRated] = []
    var popularList: [Popular] = []
    
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
        
        TMDBAPIManager.shared.fetchTVTopRated { results in
            self.topRatedList = results
            self.tableView.reloadData()
        }
        
        TMDBAPIManager.shared.fetchTVPopular { results in
            self.popularList = results
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
        print("section", indexPath.section)
        cell.collectionView.tag = indexPath.section // 태그 지정
        
        cell.collectionView.reloadData() // api통신후 tableview를 갱신하면서 collectionview도 갱신해야한다.
        
        return cell
    }
    
}

extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 0 {
            return trendList.count
        } else if collectionView.tag == 1 {
            return topRatedList.count
        } else if collectionView.tag == 2 {
            print("popular", popularList.count)
            return popularList.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCollectionViewCell", for: indexPath) as! SearchCollectionViewCell
        
    
        if collectionView.tag == 0 {
            let item = trendList[indexPath.item]
            let url = URL(string: "https://image.tmdb.org/t/p/w500\(item.posterImage)")
            cell.posterImageView.kf.setImage(with: url, placeholder: UIImage(systemName: "star.fill"))
            
 
        } else if collectionView.tag == 1 {
            let item = topRatedList[indexPath.item]
            print("top", item.posterImage)
            let url = URL(string: "https://image.tmdb.org/t/p/w500\(item.posterImage)")
            cell.posterImageView.kf.setImage(with: url, placeholder: UIImage(systemName: "star.fill"))


        } else if collectionView.tag == 2 {
            print("222222222222")
            let item = popularList[indexPath.item]
            if let image = item.posterImage {
                print("1", image)
                let url = URL(string: "https://image.tmdb.org/t/p/w500\(image)")
                cell.posterImageView.kf.setImage(with: url, placeholder: UIImage(systemName: "star.fill"))
            } else {
                print("2", item.backdrop)
//                let url = URL(string: "https://image.tmdb.org/t/p/w500\(item.backdrop)")
                cell.posterImageView.image = UIImage(systemName: "star.fill")
            }
            
        }

        return cell
    }
    
    
}
