//
//  CVSkillsCell.swift
//  CodeLatheTest
//
//  Created by Ravisankar on 18/01/21.
//

import UIKit
import TagListView

final class CVSkillsCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tagListView: TagListView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureView()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        isSelected = false
        isHidden = false
    }
    
    func configureView() {
        
        titleLabel.text = "Skills"
        titleLabel.font = .boldFont(14)
        tagListView.textFont = UIFont.regularFont(12)
        tagListView.tagBackgroundColor = .appTintColor
        tagListView.textColor = .white
    }
}

extension CVSkillsCell: CellDescriptor {
    
    func configure(data skills: [String]) {
        tagListView.removeAllTags()
        tagListView.addTags(skills)
    }
}

