//
//  GalleryCollectionViewCell.swift
//  interface_ios
//
//  Created by Larisa on 29.03.2022.
//

import UIKit

class GalleryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var fotoImageView: UIImageView!
    @IBOutlet weak var heartImageView: UIImageView!
    @IBOutlet weak var counterLabel: UILabel!
    
    func configure(image: UIImage?) {
        fotoImageView.image = image
        setup()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        fotoImageView.image = nil
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var count = 0
    var isHeartPressed = false
    
    func setup() {

        counterLabel.text = String(self.count)
        heartState(isFilled: false)
    }
    
    func heartState(isFilled: Bool) {
        var heartImage = UIImage(systemName: "heart")
        if isFilled {
            heartImage = UIImage(systemName: "heart.fill")
        }
        self.heartImageView.image = heartImage
    }
    
    @IBAction func clearButton(_ sender: UIButton) {
    
        isHeartPressed = !isHeartPressed
        heartState(isFilled: isHeartPressed)
        
        if isHeartPressed {
            self.count += 1
        } else {
            self.count -= 1
        }
        counterLabel.text = String(self.count)
    }
}
