//
//  ViewController.swift
//  Pet-Startup
//
//  Created by Field Employee on 5/26/21.
//

import UIKit
 class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

 
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var pageView: UIPageControl!
    
    
    

    
    let petName = ["Coco", "Humpy", "Kitty", "Scrappy", "Tiny"]

    let petRarity = ["Rare", "Common", "Uncommon", "Super Rare", "Very common"]

    let petPrice = ["$1500", "$500", "$1000", "$2000", "$400"]

 /*   let petName = ["image1"]

    let petRarity = ["rare"]

    let petPrice = ["1500"]

    let petImage: [UIImage] = [UIImage(named: "image1")!]

 */   var petImage = [
    
        UIImage(named: "Tiny")!,
    
        UIImage(named: "Coco")!,

        UIImage(named: "Humpy")!,

        UIImage(named: "Kitty")!,

        UIImage(named: "Scrappy")!,

        

    ]

    var timer = Timer()
     var counter = 0

    override func viewDidLoad() {

        super.viewDidLoad()

        collectionView.delegate = self

        collectionView.dataSource = self
        
        pageView.numberOfPages = petImage.count
        
        pageView.currentPage = 0
        
        DispatchQueue.main.async {
            self.timer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(self.changeImage), userInfo: nil, repeats: true)
        }
        

        
    }
    @objc func changeImage(){

        if counter < petImage.count {

            let index  = IndexPath.init(item: counter, section: 0)
            self.collectionView.scrollToItem(at:index, at: .centeredHorizontally,animated: true)

            pageView.currentPage = counter

            counter += 1


        }  else {

            counter = 0
            let index = IndexPath.init(item:counter, section:0)
            self.collectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            pageView.currentPage = counter
            
            counter = 0
        }
    }



    

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell



        cell.PetNameLabel.text = petName[indexPath.item]

        cell.PetRarityLabel.text = petRarity[indexPath.item]

        cell.PetPriceLabel.text = petPrice[indexPath.item]

        cell.PetImageView.image = petImage[indexPath.item]



        return cell

    }


    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return petImage.count

    }
    

   
}
extension ViewController: UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSection:Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0,bottom: 0, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = collectionView.frame.size
        return CGSize(width: size.width, height: size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumitemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
}
