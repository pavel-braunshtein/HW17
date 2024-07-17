//
//  CellOneViewCell.swift
//  Lesson17HW
//
//  Created by Pavel on 17.07.2024.
//

import UIKit

class CellOneViewCell: UITableViewCell {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var switcher: UISwitch!
    
    func setup(with model: CellOneDisplayModel) {
        
        label.text = model.title
        switcher.isOn = model.switcher
    }
}
