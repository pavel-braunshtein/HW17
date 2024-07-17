//
//  ViewController.swift
//  Lesson17HW
//
//  Created by Pavel on 17.07.2024.
//


import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var tableAdapter: TableViewAdapterInput?
    
    let zeroModeles: [CellZeroDisplayModel] = [CellZeroDisplayModel(title: "title 1"), CellZeroDisplayModel(title: "title 2"), CellZeroDisplayModel(title: "title 3")]
    let oneModeles: [CellOneDisplayModel] = [CellOneDisplayModel(title: "Settings 1", switcher: false), CellOneDisplayModel(title: "Settings 2", switcher: false), CellOneDisplayModel(title: "Settings 3", switcher: false)]
    let twoModeles: [CellTwoDisplayModel] = [
        CellTwoDisplayModel(title: "Title", description: "Description", image: UIImage(systemName: "pencil") ?? UIImage()),
        CellTwoDisplayModel(title: "Title", description: "Description", image: UIImage(systemName: "pencil") ?? UIImage()),
        CellTwoDisplayModel(title: "Title", description: "Description", image: UIImage(systemName: "pencil") ?? UIImage())]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let adapter = TableViewAdapter()
        
        let zeroSection = ZeroSectionAdapter(output: self)
        let oneSection = OneSectionAdapter(output: self)
        let twoSection = TwoSectionAdapter(output: self)
        adapter.sections = [zeroSection, oneSection, twoSection]
        
        tableAdapter = adapter
        tableAdapter?.setup(with: tableView)
        
    }
}

extension ViewController: ZeroSectionAdapterOutput {
    
    func zeroItem(at indexPath: IndexPath) -> CellZeroDisplayModel {
        return zeroModeles[indexPath.row]
    }
    
    func zeroItemsCount() -> Int {
        return zeroModeles.count
    }
}

extension ViewController: OneSectionAdapterOutput {
    
    func oneItem(at indexPath: IndexPath) -> CellOneDisplayModel {
        return oneModeles[indexPath.row]
    }
    
    func oneItemsCount() -> Int {
        return oneModeles.count
    }
}

extension ViewController: TwoSectionAdapterOutput {
    
    func twoItem(at indexPath: IndexPath) -> CellTwoDisplayModel {
        return twoModeles[indexPath.row]
    }
    
    func twoItemsCount() -> Int {
        return twoModeles.count
    }
}

