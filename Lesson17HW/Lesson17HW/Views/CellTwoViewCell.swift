//
//  CellTwoViewCell.swift
//  Lesson17HW
//
//  Created by Pavel on 17.07.2024.
//

import UIKit

class CellTwoViewCell: UITableViewCell {
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var descriprion: UILabel!
    
    func setup(with model: CellTwoDisplayModel) {
        
        title.text = model.title
        descriprion.text = model.description
        productImage.image = model.image
    }
}
