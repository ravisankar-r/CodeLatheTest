//
//  UITableViewExtension.swift
//  CodeLatheTest
//
//  Created by Ravisankar on 18/01/21.
//

import UIKit

extension UITableViewCell {
    
    static var identifier: String {
        return String(describing: self)
    }
}

extension UITableView {
    
    func registerCell(type: UITableViewCell.Type, identifer: String? = nil) {
        let cellId = String(describing: type)
        register(type, forCellReuseIdentifier: identifer ?? cellId)
    }
    
    func dequeueResuableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T {
            guard let cell = dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as? T else {
                fatalError(" Could not dequeue cell with identifier: \(T.identifier)")
            }
            return cell
        }
}

extension Collection {
    
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
