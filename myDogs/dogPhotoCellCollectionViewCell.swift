//
//  dogPhotoCellCollectionViewCell.swift
//  myDogs
//
//  Created by Omar Ihmoda on 1/21/18.
//  Copyright © 2018 Omar Ihmoda. All rights reserved.
//

import UIKit

class dogPhotoCellCollectionViewCell: UICollectionViewCell {
    
    var name: String?
    var color: String?
    var treat: String?
    
    @IBOutlet weak var dogPhoto: UIImageView!
    
    @IBOutlet weak var dogLabel: UILabel!
    
}
