//
//  CityTableViewCell.swift
//  Cities
//
//  Created by Judar Lima on 06/02/19.
//  Copyright © 2019 raduJ. All rights reserved.
//

import UIKit

class CityTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func bind(viewModel: CityViewModel) {
        nameLabel.text = viewModel.name
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        super.setSelected(!selected, animated: animated)
    }
    
}
