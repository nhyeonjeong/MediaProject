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
    // 타이틀 (변하지 않음)
    lazy var profileCases = ProfileData.allCases
    // 타이틀에 대한 설명
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
        return profileCases.count

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProfileTableViewCell.identifier, for: indexPath) as? ProfileTableViewCell else {
            print("cell = tableView.dequeueReusableCell 실패")
            return UITableViewCell() // 빈 테이블뷰 반환
        }
        cell.selectionStyle = .none // 셀 선택 스타일 NONE
        
        cell.titleText = profileCases[indexPath.row].rawValue
        cell.dataText = profileDataList[indexPath.row]
        cell.configureCell()
    
        return cell
    }
    
    // cell이 선택되면 화면 전환
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ProfileDetailViewController()
//        vc.dataText = profileDataList[indexPath.row]
        
        let row = indexPath.row
        vc.changeText = { value in
            // 현재의 원본이 다음 화면으로 넘어간다
            let data = self.profileDataList[row]
            
            // 다음 화면에서 pop하면서 받아온 데이터로 갱신
            self.profileDataList[row] = value
            print("profileDataList[indexPath.row] : \(self.profileDataList[row])")
            // tableView의 특정 셀의 reload
            tableView.reloadRows(at: [IndexPath(row: row, section: 0)], with: .fade)
            return (self.profileCases[row].rawValue, data) // 튜플형태로 반환
        }
        
        navigationController?.pushViewController(vc, animated: true)
    }

}
