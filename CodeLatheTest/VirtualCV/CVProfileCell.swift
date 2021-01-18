//
//  CVProfileCell.swift
//  CodeLatheTest
//
//  Created by Ravisankar on 18/01/21.
//

import UIKit

struct UserProfile {
    
    let name: String
    let phone: String
    let email: String
    let profileImage: String
}

final class CVProfileCell: UITableViewCell {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneIcon: UIImageView!
    @IBOutlet weak var emailIcon: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        configureView()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        isSelected = false
        isHidden = false
    }
    
    private func configureView() {

        nameLabel.font = .boldFont(16)
        phoneNumberLabel.font = .regularFont(12)
        emailLabel.font = .regularFont(12)
        emailIcon.tintColor = .appTintColor
        phoneIcon.tintColor = .appTintColor
        emailIcon.image = UIImage(systemName: "mail")?.withRenderingMode(.alwaysTemplate)
        phoneIcon.image = UIImage(systemName: "phone")?.withRenderingMode(.alwaysTemplate)
    }
}

extension CVProfileCell: CellDescriptor {
    
    func configure(data profile: UserProfile) {
        
        profileImageView.image = UIImage(systemName: "person")
        nameLabel.text = profile.name
        emailLabel.text = profile.email
        phoneNumberLabel.text = profile.phone
    }
}
