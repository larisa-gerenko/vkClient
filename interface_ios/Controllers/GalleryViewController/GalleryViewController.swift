//
//  GalleryViewController.swift
//  interface_ios
//
//  Created by Larisa on 29.03.2022.
//

import UIKit

class GalleryViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let reuseIdentificator = "reuseIdentificator"
    var fotoArray = [String]()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        collectionView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: "GalleryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentificator)
        collectionView.delegate =  self
        collectionView.dataSource = self
    }
    

   

}

extension GalleryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fotoArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentificator, for: indexPath) as? GalleryCollectionViewCell else {return UICollectionViewCell()}
        
        cell.configure(image: UIImage(named: fotoArray[indexPath.item]))
        return cell
    }
}

extension GalleryViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        let view = UIView(frame: self.view.frame)
        view.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        let imageView = UIImageView(frame: view.frame)
        self.view.addSubview(view)
        view.addSubview(imageView)
        imageView.image = UIImage(named: fotoArray[indexPath.item])
        imageView.contentMode = .scaleAspectFit
    }
    
}

extension GalleryViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width / 2 - 10, height: collectionView.bounds.width / 2 - 10)
    }
}


