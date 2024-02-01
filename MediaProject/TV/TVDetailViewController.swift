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
        tableView.register(DetailTableViewCell.self, forCellReuseIdentifier: "DetailTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 180
        
        return tableView
    }()

    let list = ["tv정보", "비슷한 콘텐츠 추천", "캐스팅 정보"]
    
    /// 추천하는 드라마 배열
    var recommentList: [TV] = []
    
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailTableViewCell", for: indexPath) as! DetailTableViewCell
        
        cell.groupTitle.text = list[indexPath.row]
        cell.collectionView.delegate = self
        cell.collectionView.dataSource = self
        cell.collectionView.register(TVRecommendCollectionViewCell.self, forCellWithReuseIdentifier: "DetailCollectionViewCell")
        
        cell.collectionView.reloadData()
        return cell
    }
    
    
}

extension TVDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recommentList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailCollectionViewCell", for: indexPath) as! TVRecommendCollectionViewCell
        
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

