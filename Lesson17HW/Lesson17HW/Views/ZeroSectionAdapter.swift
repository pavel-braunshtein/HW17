//
//  ZeroSectionAdapter.swift
//  Lesson17HW
//
//  Created by Pavel on 17.07.2024.
//

import UIKit

protocol ZeroSectionAdapterOutput: AnyObject {
    
    func zeroItem(at indexPath: IndexPath) -> CellZeroDisplayModel
    func zeroItemsCount() -> Int
}

class ZeroSectionAdapter {
    
    private weak var output: ZeroSectionAdapterOutput!
    
    required init(output: ZeroSectionAdapterOutput) {
        self.output = output
    }
}

extension ZeroSectionAdapter: SectionAdapterInput {
    
    func tableView(titleForHeaderInSection section: Int, in tableView: UITableView) -> String? {
        
        return "Section 0"
    }
    
    func registerCells(in tableView: UITableView) {
        
        let nib = UINib(nibName: "CellZero", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CellZero")
    }
    
    func numberOfRows(for section: Int, in tableView: UITableView) -> Int {
        return output.zeroItemsCount()
    }
    
    func cellForRow(at indexPath: IndexPath, in tableView: UITableView) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CellZero", for: indexPath) as? CellZeroViewCell
        else {
            assertionFailure()
            return UITableViewCell()
        }
        
        let model = output.zeroItem(at: indexPath)
        cell.setup(with: model)
        
        return cell
    }
}
