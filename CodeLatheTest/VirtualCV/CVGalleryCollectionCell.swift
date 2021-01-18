//
//  CVGalleryCollectionCell.swift
//  CodeLatheTest
//
//  Created by Ravisankar on 18/01/21.
//

import UIKit

final class CVGalleryCollectionCell: UICollectionViewCell {
    
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureView()
    }
    
    func configureView() {
        
        containerView.layer.borderWidth = 2
        containerView.layer.borderColor = UIColor.appTintColor.cgColor
        containerView.layer.cornerRadius = 5.0
        containerView.layer.masksToBounds = true
    }
    
    func configure(_ image: UIImage) {
        
        imageView.image = image
    }
}
