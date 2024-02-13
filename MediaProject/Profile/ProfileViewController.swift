//
//  ProfileViewController.swift
//  MediaProject
//
//  Created by 남현정 on 2024/02/12.
//

import UIKit

class ProfileViewController: BaseViewController {
    
    enum ProfileData: String, CaseIterable {
        case name = "이름"
        case userName = "사용자 이름"
        case genderUpper = "성별 대명사"
        case introduce = "소개"
        case link = "링크"
        case gender = "성별"
    }
    
    let mainView = ProfileView()
    
    var profileDataList: [String] = []
    
    override func loadView() {
        self.view = mainView
    
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "프로필 편집"
        
        for item in ProfileData.allCases {
            profileDataList.append(item.rawValue)
        }
        
        configureTableView()
        configureView()
        
    }
    
    override func configureView() {
        // 프로필 이미지 버튼
//        mainView.profileImageView.isUserInteractionEnabled = true
//        mainView.profileImageView.addtarget
    }


}

extension ProfileViewController : UITableViewDelegate, UITableViewDataSource {
    
    func configureTableView() {
        mainView.profileTableView.delegate = self
        mainView.profileTableView.dataSource = self
        mainView.profileTableView.register(ProfileTableViewCell.self, forCellReuseIdentifier: ProfileTableViewCell.identifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("numberOfRowsInSection")
        return profileDataList.count

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProfileTableViewCell.identifier, for: indexPath) as? ProfileTableViewCell else {
            print("cell = tableView.dequeueReusableCell 실패")
            return UITableViewCell() // 빈 테이블뷰 반환
        }
        cell.selectionStyle = .none // 셀 선택 스타일 NONE
        
        cell.titleText = profileDataList[indexPath.row]
        cell.dataText = profileDataList[indexPath.row]
        cell.configureCell()
    
        return cell
    }
    
    // cell이 선택되면 화면 전환
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ProfileDetailViewController()
        vc.dataText = profileDataList[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }

}
