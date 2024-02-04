//
//  SearchViewController.swift
//  MediaProject
//
//  Created by 남현정 on 2024/01/30.
//

import UIKit
import SnapKit
import Kingfisher

class TVGroupViewController: BaseViewController {

    let mainView = TVGroupUIView()
    /// 섹션에 나올 타이틀
    let groupTitleList = ["TV Trend", "TV TopRated", "TV Popular"]

    /// 통신 순서
    let apiOrder: [TMDBAPI_Request] = [.trending, .topRated, .popular]
    /// Trending, TopRaged, Popular 한 번에 저장
    var tvModelList: [TVModels] = [
        TVModels(results: []),
        TVModels(results: []),
        TVModels(results: []),
    ]
    
    override func loadView() {
        view = mainView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
 
        configureTableView()
        fetchTMDB()
    }
    
    func fetchTMDB() {
        let group = DispatchGroup()
        
        // 반복으로 줄였는데 쟐 동작함
        for i in 0..<tvModelList.count {
            group.enter()
            TMDBAPIManager.shared.fetchTVData(type: TVModels.self, api: apiOrder[i]) { results in
                self.tvModelList[i] = results
                group.leave()
            }
        }
        
        group.notify(queue: .main) {
            self.mainView.tableView.reloadData()
        }
    }
}

extension TVGroupViewController: UITableViewDelegate, UITableViewDataSource {
    func configureTableView() {
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupTitleList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.identifier, for: indexPath) as! SearchTableViewCell
        cell.groupTitle.text = groupTitleList[indexPath.row]
        
        cell.collectionView.delegate = self
        cell.collectionView.dataSource = self
        print("section", indexPath.section)
        cell.collectionView.tag = indexPath.row // 태그 지정
        
        cell.collectionView.reloadData() // api통신후 tableview를 갱신하면서 collectionview도 갱신해야한다.
        return cell
    }
    
}

extension TVGroupViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return tvModelList[collectionView.tag].results.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCollectionViewCell.identifier, for: indexPath) as! SearchCollectionViewCell

        let item = tvModelList[collectionView.tag].results[indexPath.item]
        
        if let image = item.posterImage {
            
            let url = URL(string: "https://image.tmdb.org/t/p/w500\(image)")
            cell.posterImageView.kf.setImage(with: url, placeholder: UIImage(systemName: "star.fill"))
        } else {

            cell.posterImageView.image = UIImage(systemName: "star.fill")
        }
        
        return cell
    }
    
    
}
