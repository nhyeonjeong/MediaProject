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
    
    var trendList: [Trend] = []
    var topRatedList: [TopRated] = []
    var popularList: [Popular] = []
    
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
        
        group.enter()
        TMDBAPIManager.shared.fetchTVTrend { results in
            self.trendList = results
            group.leave()
            
        }
        group.enter()
        TMDBAPIManager.shared.fetchTVTopRated { results in
            self.topRatedList = results
            group.leave()
        }
        
        group.enter()
        TMDBAPIManager.shared.fetchTVPopular { results in
            self.popularList = results
            group.leave()
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as! SearchTableViewCell
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

            let item = popularList[indexPath.item]
            if let image = item.posterImage {
                print("1", image)
                let url = URL(string: "https://image.tmdb.org/t/p/w500\(image)")
                cell.posterImageView.kf.setImage(with: url, placeholder: UIImage(systemName: "star.fill"))
            } else {
//                let url = URL(string: "https://image.tmdb.org/t/p/w500\(item.backdrop)")
                cell.posterImageView.image = UIImage(systemName: "star.fill")
            }
            
        }

        return cell
    }
    
    
}
