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
    
    /// 추천하는 드라마 리스트
    var recommentList: [TV] = []
    /// 드라마 상세소개
    var detailData: TVDetailModel = TVDetailModel(name: "", overview: "", posterImage: "", popularity: 0, backdrop_path: "", homepageUrl: "", episodeNumber: 0)
    
    /// 드라마 캐스팅 정보 리스트
    var castingList: [TVCast] = []
    
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
        TMDBAPIManager.shared.fetchTVRecommend { tvdatas in
            self.recommentList = tvdatas
            group.leave()
        }
        
        group.enter()
        TMDBAPIManager.shared.fetchTVDetails { detail in
            self.detailData = detail
            group.leave()
        }
        
        group.enter()
        TMDBAPIManager.shared.fetchTVAggregate { casts in
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

            let cell = tableView.dequeueReusableCell(withIdentifier: "TVDetailTableViewCell", for: indexPath) as! TVDetailTableViewCell
            cell.groupTitle.text = list[indexPath.row]
            
            let url = URL(string: "https://image.tmdb.org/t/p/w500\(detailData.posterImage)")
            cell.posterImageVies.kf.setImage(with: url)
            
            cell.titleLabel.text = detailData.name
            cell.popularityLabel.text = "\(detailData.popularity) 점"
            cell.overviewLabel.text = detailData.overview
   
            return cell
            
        } else if indexPath.row == 1 { // 비슷한 컨틴츠 추천
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "TVDetailRecommendTableViewCell", for: indexPath) as! TVDetailRecommendTableViewCell
            cell.groupTitle.text = list[indexPath.row]
            cell.collectionView.delegate = self
            cell.collectionView.dataSource = self
            cell.collectionView.register(TVRecommendCollectionViewCell.self, forCellWithReuseIdentifier: "TVRecommendCollectionViewCell")
            cell.collectionView.tag = 1 // 태그 붙이기
            cell.collectionView.reloadData()
                
            return cell
            
        } else { // 캐스팅 정보

            let cell = tableView.dequeueReusableCell(withIdentifier: "TVDetailCastingTableViewCell", for: indexPath) as! TVDetailCastingTableViewCell
            cell.groupTitle.text = "\(detailData.name)의 \(list[indexPath.row])"
            cell.collectionView.delegate = self
            cell.collectionView.dataSource = self
            cell.collectionView.register(TVDetailCastingCollectionViewCell.self, forCellWithReuseIdentifier: "TVDetailCastingCollectionViewCell")
            cell.collectionView.tag = 2 // 태그 붙이기
            cell.collectionView.reloadData()
                
            return cell
        }
        
    }

}

extension TVDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 1 {
            return recommentList.count
        } else { // Tag가 2라면?
            return castingList.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TVRecommendCollectionViewCell", for: indexPath) as! TVRecommendCollectionViewCell
            
            if let image = recommentList[indexPath.item].posterImage {
                let imageUrl = URL(string: "https://image.tmdb.org/t/p/w500\(image)")
                cell.posterImageView.kf.setImage(with: imageUrl)
            } else {
                cell.posterImageView.image = UIImage(systemName: "xmark.app.fill")
            }
            
            
            cell.titleLabel.text = recommentList[indexPath.item].name
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TVDetailCastingCollectionViewCell", for: indexPath) as! TVDetailCastingCollectionViewCell

            let imageUrl = URL(string: "https://image.tmdb.org/t/p/w500\(castingList[indexPath.item].profile)")
            cell.actressImageView.kf.setImage(with: imageUrl, placeholder: UIImage(systemName: "xmark"))
  
            cell.actressNameLabel.text = castingList[indexPath.item].name // 배우 이름
            return cell
        }
        
    }
    
    
    
}
