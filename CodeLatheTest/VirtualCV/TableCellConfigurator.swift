//
//  TableCellConfigurator.swift
//  CodeLatheTest
//
//  Created by Ravisankar on 18/01/21.
//

import UIKit

protocol CellDescriptor {
    associatedtype CellModel
    func configure(data: CellModel)
}

protocol CellConfigurator {
    static var reuseId: String { get }
    func configure(cell: UITableViewCell)
}

class TableCellConfigurator<CellType: CellDescriptor, CellModel>: CellConfigurator where CellType.CellModel == CellModel, CellType: UITableViewCell {
    static var reuseId: String { return String(describing: CellType.self) }
    
    let item: CellModel
    
    init(item: CellModel) {
        self.item = item
    }
    
    func configure(cell: UITableViewCell) {
        (cell as! CellType).configure(data: item)
    }
}
