//
//  imageView.swift
//  PetFlix
//
//  Created by BS1098 on 3/7/24.
//

import UIKit

extension UIImageView {
    func loadImage(from urlString: String, completion: (() -> Void)? = nil) {
        guard let url = URL(string: urlString) else {
            completion?()
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            guard let data = data, let image = UIImage(data: data), error == nil else {
                completion?()
                return
            }
            
            DispatchQueue.main.async {
                self?.image = image
                completion?()
            }
        }
        task.resume()
    }
}
