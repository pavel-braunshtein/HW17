//
//  TwoSectionAdapter.swift
//  Lesson17HW
//
//  Created by Pavel on 17.07.2024.
//

import UIKit

protocol TwoSectionAdapterOutput: AnyObject {
    
    func twoItem(at indexPath: IndexPath) -> CellTwoDisplayModel
    func twoItemsCount() -> Int
}

class TwoSectionAdapter {
    
    private weak var output: TwoSectionAdapterOutput!
    
    required init(output: TwoSectionAdapterOutput) {
        self.output = output
    }
}

extension TwoSectionAdapter: SectionAdapterInput {
    
    func tableView(titleForHeaderInSection section: Int, in tableView: UITableView) -> String? {
        return "Section 2"
    }
    
    
    func registerCells(in tableView: UITableView) {
        
        let nib = UINib(nibName: "CellTwo", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CellTwo")
    }
    
    func numberOfRows(for section: Int, in tableView: UITableView) -> Int {
        return output.twoItemsCount()
    }
    
    func cellForRow(at indexPath: IndexPath, in tableView: UITableView) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CellTwo", for: indexPath) as? CellTwoViewCell
        else {
            assertionFailure()
            return UITableViewCell()
        }
        
        let model = output.twoItem(at: indexPath)
        cell.setup(with: model)
        
        return cell
    }
}
