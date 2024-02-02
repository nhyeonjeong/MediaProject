//
//  DetailViewController.swift
//  MediaProject
//
//  Created by 남현정 on 2024/01/31.
//

import UIKit
import SnapKit
import Kingfisher

class TVDetailViewController: UIViewController {
    
    lazy var tvTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .black
        // 추천 테이블뷰셀
        tableView.register(TVDetailRecommendTableViewCell.self, forCellReuseIdentifier: "TVDetailRecommendTableViewCell")
        // 드라마 디테일 테이블뷰셀
        tableView.register(TVDetailTableViewCell.self, forCellReuseIdentifier: "TVDetailTableViewCell")
        // 드라마 캐스팅 정보 테이블뷰셀
        
        
        tableView.delegate = self
        tableView.dataSource = self
//        tableView.rowHeight = 280
        tableView.rowHeight = UITableView.automaticDimension // 유동적으로 높이 늘어나도록
        
        return tableView
    }()

    let list = ["TV정보", "비슷한 콘텐츠 추천", "캐스팅 정보"]
    
    /// 추천하는 드라마 리스트
    var recommentList: [TV] = []
    /// 드라마 상세소개
    var detailData: TVDetailModel = TVDetailModel(name: "", overview: "", posterImage: "", popularity: 0, backdrop_path: "", homepageUrl: "", episodeNumber: 0)
    
    /// 드라마 캐스팅 정보 리스트
    var castingLiat: [TVCast] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        configureHierarchy()
        configureConstraints()
        
        fetchTVData()
    }
    
    /// 테이블뷰에 Tv정보 네트워크 통신
    func fetchTVData() {
        
        let group = DispatchGroup()
        
        group.enter()
        TMDBAPIManager.shared.fetchTVRecommend { tvdatas in
            self.recommentList = tvdatas
            group.leave()
        }
        
        group.enter()
        TMDBAPIManager.shared.fetchTVDetails { detail in
            self.detailData = detail
            group.leave()
        }
        
//        group.enter()
//        TMDBAPIManager.shared.fetchTVAggregate { casts in
//            self.castingLiat = casts
//            group.leave()
//        }
        
        group.notify(queue: .main) {
            self.tvTableView.reloadData()
        }
    }
}

extension TVDetailViewController {
    func configureHierarchy() {
        view.addSubview(tvTableView)
    }
    
    func configureConstraints() {
        tvTableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
            
        }
    }
}


extension TVDetailViewController: UITableViewDelegate, UITableViewDataSource {
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            print("tableView0")
            let cell = tableView.dequeueReusableCell(withIdentifier: "TVDetailTableViewCell", for: indexPath) as! TVDetailTableViewCell
            cell.groupTitle.text = list[indexPath.row]
            
            let url = URL(string: "https://image.tmdb.org/t/p/w500\(detailData.posterImage)")
            cell.posterImageVies.kf.setImage(with: url)
            
            cell.titleLabel.text = detailData.name
            cell.popularityLabel.text = "\(detailData.popularity) 점"
            cell.overviewLabel.text = detailData.overview
   
            return cell
            
        } else if indexPath.row == 1 {
            print("tableView1")
            let cell = tableView.dequeueReusableCell(withIdentifier: "TVDetailRecommendTableViewCell", for: indexPath) as! TVDetailRecommendTableViewCell
            cell.groupTitle.text = list[indexPath.row]
            cell.collectionView.delegate = self
            cell.collectionView.dataSource = self
            cell.collectionView.register(TVRecommendCollectionViewCell.self, forCellWithReuseIdentifier: "TVRecommendCollectionViewCell")
            
            cell.collectionView.reloadData()
                
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TVDetailRecommendTableViewCell", for: indexPath) as! TVDetailRecommendTableViewCell
            cell.groupTitle.text = "\(detailData.name)의 \(list[indexPath.row])"
            cell.collectionView.delegate = self
            cell.collectionView.dataSource = self
            cell.collectionView.register(TVRecommendCollectionViewCell.self, forCellWithReuseIdentifier: "TVRecommendCollectionViewCell")
            
            cell.collectionView.reloadData()
                
            return cell
        }
        
    }

}

extension TVDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recommentList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TVRecommendCollectionViewCell", for: indexPath) as! TVRecommendCollectionViewCell
        
        if let image = recommentList[indexPath.item].posterImage {
            let imageUrl = URL(string: "https://image.tmdb.org/t/p/w500\(image)")
            cell.posterImageView.kf.setImage(with: imageUrl)
        } else {
            cell.posterImageView.image = UIImage(systemName: "xmark.app.fill")
        }
       
        
        cell.titleLabel.text = recommentList[indexPath.item].name
        return cell
    }
    
    
    
}

