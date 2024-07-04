//
//  PopularCollectionView.swift
//  PetFlix
//
//  Created by BS1098 on 3/7/24.
//

import UIKit

class PopularCollectionView: UICollectionViewCell {
    
    @IBOutlet weak var popularImage: UIImageView!
    
    func configure(with imageURL: String) {
            popularImage.loadImage(from: imageURL)
        }
}
