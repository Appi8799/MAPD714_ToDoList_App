//
//  CustomCellTableViewCell.swift
//  demoTodo
//
//  Group#04 - MAPD714 iOS Development
//  Students Name: Ajay Shrivastav (301284668),
//                 Apeksha Parmar (301205325),
//                 Brijen Jayeshbhai Shah (301271637)
//  Created by Apeksha Parmar on 2022-12-06.
//

import UIKit

class CustomCellTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
