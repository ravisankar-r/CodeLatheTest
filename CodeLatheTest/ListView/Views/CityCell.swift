//
//  CityCell.swift
//  CodeLatheTest
//
//  Created by Ravisankar on 18/01/21.
//

import Foundation
import UIKit

class CityCell: UITableViewCell {

    private lazy var titleLabel: UILabel = {
        
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var leftSubTitleLabel: UILabel = {
       
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var rightSubTitleLabel: UILabel = {
       
        let label = UILabel()
        label.textAlignment = .right
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var subTitleStackView: UIStackView = {
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.addArrangedSubview(leftSubTitleLabel)
        stackView.addArrangedSubview(rightSubTitleLabel)
        return stackView
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
        contentView.addSubview(subTitleStackView)
        
        titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        subTitleStackView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        subTitleStackView.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        subTitleStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant:  -10).isActive = true
        subTitleStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
    }
    
    func config(city: City) {
        titleLabel.text = city.name
        leftSubTitleLabel.text = city.state
        rightSubTitleLabel.text = city.country
    }
}
