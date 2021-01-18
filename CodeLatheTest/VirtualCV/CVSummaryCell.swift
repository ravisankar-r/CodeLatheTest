//
//  CVSummaryCell.swift
//  CodeLatheTest
//
//  Created by Ravisankar on 18/01/21.
//

import UIKit

final class CVSummaryCell: UITableViewCell {
    
    private lazy var titleLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Bio"
        label.textColor = .black
        label.font = .boldFont(14)
        return label
    }()
    
    private lazy var summaryLabel: UILabel = {
        
        let label = UILabel()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .regularFont(12)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        isSelected = false
        isHidden = false
    }
    
    private func configureView() {
        
        selectionStyle = .none
        contentView.addSubview(titleLabel)
        contentView.addSubview(summaryLabel)
        
        titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12).isActive = true
        
        summaryLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        summaryLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor).isActive = true
        
        summaryLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8).isActive = true
        summaryLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
    }
}

extension CVSummaryCell: CellDescriptor {
    
    func configure(data summary: String) {
        summaryLabel.text = summary
    }
}
