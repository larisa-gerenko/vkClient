//
//  CustomTableViewCell.swift
//  TableView
//
//  Created by Larisa on 23.03.2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var fotoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var completion: (() -> Void)?
    
    func configure(name: String?, description: String?, image: UIImage?) {
        fotoImageView.image = image
        nameLabel.text = name
        descriptionLabel.text = description
    }
    
    func configure(group: Group) {
        
        if let avatarPath = group.avatarImagePath {
            fotoImageView.image = UIImage(named: avatarPath)
        }
        
        nameLabel.text = group.name
        descriptionLabel.text = group.description
    }
    
    func configure(friend: Friend, completion: @escaping () -> Void) {
        
        if let avatarPath = friend.avatar {
            fotoImageView.image = UIImage(named: avatarPath)
        }
        nameLabel.text = friend.name
        self.completion = completion
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        fotoImageView.image = nil
        nameLabel.text = nil
        descriptionLabel.text = nil
        completion = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func pressImageButton(_ sender: Any) {
        
        UIView.animate(withDuration: 3) {[weak self] in
            self?.fotoImageView.transform = CGAffineTransform.init(scaleX: 0.5, y: 0.5)
        } completion: { _ in
            UIView.animate(withDuration: 1,
                           delay: 0,
                           usingSpringWithDamping: 0.3,
                           initialSpringVelocity: 1,
                           options: []) {[weak self] in
                self?.fotoImageView.transform = .identity
            } completion: { [weak self] _ in
                self?.completion?()
            }

        }

        
    }
    
}
