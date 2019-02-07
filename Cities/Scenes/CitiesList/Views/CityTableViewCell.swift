//
//  CityTableViewCell.swift
//  Cities
//
//  Created by Judar Lima on 06/02/19.
//  Copyright © 2019 raduJ. All rights reserved.
//

import UIKit

final class CityTableViewCell: UITableViewCell {
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var cellContentView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    func bind(viewModel: CityViewModel) {
        nameLabel.text = viewModel.name
    }
    
    private func setupView() {
        backgroundColor = .clear
        cellContentView.layer.borderColor = UIColor.black.cgColor
        cellContentView.layer.borderWidth = 1
        cellContentView.layer.cornerRadius = 8
        cellContentView.clipsToBounds = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        super.setSelected(false, animated: false)
    }
    
}
