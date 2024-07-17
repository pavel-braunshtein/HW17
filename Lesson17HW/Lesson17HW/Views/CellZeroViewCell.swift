//
//  CellZeroViewCell.swift
//  Lesson17HW
//
//  Created by Pavel on 17.07.2024.
//

import UIKit

class CellZeroViewCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    
    func setup(with model: CellZeroDisplayModel) {
        
        title.text = model.title
    }
}
