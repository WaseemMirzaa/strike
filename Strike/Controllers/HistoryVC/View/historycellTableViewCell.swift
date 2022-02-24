//
//  historycellTableViewCell.swift
//  Strike
//
//  Created by Buzzware Tech on 24/02/2022.
//

import UIKit

class historycellTableViewCell: UITableViewCell {

    
    @IBOutlet weak var woncollection: UICollectionView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
