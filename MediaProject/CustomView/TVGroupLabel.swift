//
//  TVDetailGroupLabel.swift
//  MediaProject
//
//  Created by 남현정 on 2024/02/04.
//

import UIKit

/// 테이블에 부여되는 타이틀
class TVGroupLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureView() {
        font = .boldSystemFont(ofSize: 18)
        textColor = .white
    }

}
