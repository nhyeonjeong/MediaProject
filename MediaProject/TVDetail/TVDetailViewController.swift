//
//  DetailViewController.swift
//  MediaProject
//
//  Created by 남현정 on 2024/01/31.
//

import UIKit
import SnapKit
import Kingfisher

class TVDetailViewController: BaseViewController {
    
    let mainView = TVDatailUIView()

    let list = ["TV정보", "비슷한 콘텐츠 추천", "캐스팅 정보"]

    /// 드라마 상세소개
    var detailList: TVDetailModel = TVDetailModel(name: "", overview: "", posterImage: "", popularity: 0, backdrop_path: "", homepageUrl: "", episodeNumber: 0)
    /// 추천하는 드라마 리스트
    var recommentList: TVModels = TVModels(results: [])
    /// 드라마 캐스팅 정보 리스트
    var castingList: TVCastModel = TVCastModel(cast: [])
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.tvTableView.delegate = self
        mainView.tvTableView.dataSource = self
        // 네트워크 통신
        fetchTVData()
    }
    
    /// 테이블뷰에 Tv정보 네트워크 통신
    func fetchTVData() {
        
        let group = DispatchGroup()
        
        group.enter()
        TMDBAPIManager.shared.fetchTVData(type: TVDetailModel.self, api: .detail(id: 16420)) { detail in
            self.detailList = detail
            group.leave()
        }
        group.enter()
        TMDBAPIManager.shared.fetchTVData(type: TVModels.self, api: .recommend(id: 16420)) { tvdatas in
            self.recommentList = tvdatas
            group.leave()
        }
        group.enter()
        TMDBAPIManager.shared.fetchTVData(type: TVCastModel.self, api: .casting(id: 16420)) { casts in
            self.castingList = casts
            group.leave()
        }
        
        group.notify(queue: .main) {

            self.mainView.tvTableView.reloadData()
        }
    }
}

extension TVDetailViewController: UITableViewDelegate, UITableViewDataSource {
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 드라마 디테일 정보뷰
        if indexPath.row == 0 {

            let cell = tableView.dequeueReusableCell(withIdentifier: TVDetailTableViewCell.identifier, for: indexPath) as! TVDetailTableViewCell
            cell.groupTitle.text = list[indexPath.row]
            
            let url = URL(string: "https://image.tmdb.org/t/p/w500\(detailList.posterImage)")
            cell.posterImageVies.kf.setImage(with: url)
            
            cell.titleLabel.text = detailList.name
            cell.popularityLabel.text = "\(detailList.popularity) 점"
            cell.overviewLabel.text = detailList.overview
   
            return cell
            
        } else if indexPath.row == 1 { // 비슷한 컨틴츠 추천
            print(#function, indexPath.row)
            let cell = tableView.dequeueReusableCell(withIdentifier: TVDetailRecommendTableViewCell.identifier, for: indexPath) as! TVDetailRecommendTableViewCell
            cell.groupTitle.text = list[indexPath.row]
            cell.collectionWidth = 130
            cell.collectionHeight = 230
            
            cell.collectionView.delegate = self
            cell.collectionView.dataSource = self
            cell.collectionView.register(TVRecommendCollectionViewCell.self, forCellWithReuseIdentifier: TVRecommendCollectionViewCell.identifier)
            cell.collectionView.tag = indexPath.row // 태그 붙이기
            cell.collectionView.reloadData()
                
            return cell
            
        } else { // 캐스팅 정보

            let cell = tableView.dequeueReusableCell(withIdentifier: TVDetailCastingTableViewCell.identifier, for: indexPath) as! TVDetailCastingTableViewCell
            cell.groupTitle.text = "\(detailList.name)의 \(list[indexPath.row])"
//            cell.collectionWidth = 80
//            cell.collectionHeight = 150
            
            cell.collectionView.delegate = self
            cell.collectionView.dataSource = self
            cell.collectionView.register(TVDetailCastingCollectionViewCell.self, forCellWithReuseIdentifier: TVDetailCastingCollectionViewCell.identifier)
            cell.collectionView.tag = indexPath.row // 태그 붙이기
            cell.collectionView.reloadData()
                
            return cell
        }
        
    }

}

extension TVDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 1 {
            return recommentList.results.count
        } else { // Tag가 2라면?
            return castingList.cast.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TVRecommendCollectionViewCell.identifier, for: indexPath) as! TVRecommendCollectionViewCell
            
            if let image = recommentList.results[indexPath.item].posterImage {
                let imageUrl = URL(string: "https://image.tmdb.org/t/p/w500\(image)")
                cell.posterImageView.kf.setImage(with: imageUrl)
            } else {
                cell.posterImageView.image = UIImage(systemName: "xmark.app.fill")
            }
            
            
            cell.titleLabel.text = recommentList.results[indexPath.item].name
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TVDetailCastingCollectionViewCell.identifier, for: indexPath) as! TVDetailCastingCollectionViewCell

            let imageUrl = URL(string: "https://image.tmdb.org/t/p/w500\(castingList.cast[indexPath.item].profile)")
            cell.actressImageView.kf.setImage(with: imageUrl, placeholder: UIImage(systemName: "xmark"))
  
            cell.actressNameLabel.text = castingList.cast[indexPath.item].name // 배우 이름
            return cell
        }
        
    }
    
    
    
}

