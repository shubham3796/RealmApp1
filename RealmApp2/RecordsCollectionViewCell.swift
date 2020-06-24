//
//  RecordsCollectionViewCell.swift
//  RealmApp2
//
//  Created by Pranjal Singhai on 18/06/20.
//  Copyright © 2020 Capgemini. All rights reserved.
//

import UIKit

class RecordsCollectionViewCell: UICollectionViewCell {

    static let identifier = "RecordsCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    static func nib() -> UINib {
        return UINib(nibName: "RecordsCollectionViewCell", bundle: nil)
    }
}
