//
//  CVGalleryCell.swift
//  CodeLatheTest
//
//  Created by Ravisankar on 18/01/21.
//

import UIKit

final class CVGalleryCell: UITableViewCell {
    
    @IBOutlet weak var galleryCollectionView: UICollectionView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    var images: [String] = []
    
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
        
        titleLabel.text = "Gallery"
        titleLabel.font = .boldFont(14)
        galleryCollectionView.dataSource = self
        galleryCollectionView.delegate = self
        let nib = UINib(nibName: "CVGalleryCollectionCell", bundle: nil)
        galleryCollectionView?.register(nib, forCellWithReuseIdentifier: "CVGalleryCollectionCell")
        if let flowLayout = self.galleryCollectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: 95, height: 93)
        }
    }
}

extension CVGalleryCell: CellDescriptor {
    
    func configure(data images: [String]) {
        self.images = images
        galleryCollectionView.reloadData()
    }
}

extension CVGalleryCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
       return CGSize(width: 95, height: 93)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CVGalleryCollectionCell",
                                                         for: indexPath) as? CVGalleryCollectionCell {
            let image = images[indexPath.row]
            cell.configure(UIImage(named: image)!)
            return cell
        }
        return UICollectionViewCell()
    }
}
