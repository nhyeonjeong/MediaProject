//
//  UITableViewCell+Extension.swift
//  MediaProject
//
//  Created by 남현정 on 2024/02/04.
//

import UIKit

extension UITableViewCell: ReusableCellProtocol {
    static var identifier: String {
        String(describing: self)
    }
}
