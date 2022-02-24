//
//  answerTableViewCell.swift
//  Strike
//
//  Created by Buzzware Tech on 24/02/2022.
//

import UIKit

class answerTableViewCell: UITableViewCell {

    @IBOutlet weak var iv_image: UIImageView!
    
    @IBOutlet weak var lblname: UILabel!
    
    @IBOutlet weak var ivView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
