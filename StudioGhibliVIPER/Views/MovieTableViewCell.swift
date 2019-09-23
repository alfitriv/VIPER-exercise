//
//  MovieTableViewCell.swift
//  StudioGhibliVIPER
//
//  Created by Vania Radmila Alfitri on 21/09/19.
//  Copyright © 2019 Gojek. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func updateData(model: Movie) {
        titleLabel.text = model.title
        detailLabel.text = model.director
    }

}
