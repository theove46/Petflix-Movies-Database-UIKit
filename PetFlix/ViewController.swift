//
//  ViewController.swift
//  PetFlix
//
//  Created by BS1098 on 3/7/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var PopularCollectionView: UICollectionView!
    
    
    var moviesImagesUrls = [
        "https://image.tmdb.org/t/p/original/xlaY2zyzMfkhk0HSC5VUwzoZPU1.jpg",
        "https://image.tmdb.org/t/p/w500//qJ2tW6WMUDux911r6m7haRef0WH.jpg",
        "https://image.tmdb.org/t/p/w500//8tZYtuWezp8JbcsvHYO0O46tFbo.jpg",
    ]
    
    var timer: Timer?
    var currentSliderIndex = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        PopularCollectionView.delegate = self
        PopularCollectionView.dataSource = self
        
        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(slideToNext), userInfo: nil, repeats: true)
    }
    
    @objc func slideToNext(){
        if currentSliderIndex < moviesImagesUrls.count-1 {
            currentSliderIndex += 1
        } else {
            currentSliderIndex = 0
        }
        
        PopularCollectionView.scrollToItem(at: IndexPath(item: currentSliderIndex, section: 0), at: .right, animated: true)
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moviesImagesUrls.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCell", for: indexPath) as! PopularCollectionView
                
                // Configure the cell with the image URL
                cell.configure(with: moviesImagesUrls[indexPath.item])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: PopularCollectionView.frame.width, height: PopularCollectionView.frame.height)
    }
    
    
}

