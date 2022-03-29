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
    var modalView: UIView?
    var imageItem: UIImageView?
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        collectionView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: "GalleryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentificator)
        collectionView.delegate =  self
        collectionView.dataSource = self
        modalView = UIView(frame: self.view.frame)
        modalView?.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        modalView?.tag = 100
        imageItem = UIImageView(frame: modalView!.frame)
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        modalView?.addGestureRecognizer(tap)
        
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        if let viewWithTag = self.view.viewWithTag(100) {
                viewWithTag.removeFromSuperview()
        }else{
                print("No!")
        }
    }
    
    @objc func checkAction(sender : UITapGestureRecognizer) {
        if let uiView = self.view.viewWithTag(100) {
            uiView.removeFromSuperview()
        }
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
        
        guard let modalView = self.modalView else { return }
        guard let imageItem = self.imageItem else { return }
        
        self.view.addSubview(modalView)
        modalView.addSubview(imageItem)
        
        imageItem.image = UIImage(named: fotoArray[indexPath.item])
        imageItem.contentMode = .scaleAspectFit
    }
    
}

extension GalleryViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width / 2 - 10, height: collectionView.bounds.width / 2 - 10)
    }
}


