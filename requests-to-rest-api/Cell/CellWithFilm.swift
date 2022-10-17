//
//  CellWithFilm.swift
//  requests-to-rest-api
//
//  Created by Nikolay Kiyko on 12.10.2022.
//  Copyright ⓒ Nikolay Kiyko 2022. All rights reserved.
//

import UIKit
import SnapKit

class CellWithFilm: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
