//
//  FriendsViewController.swift
//  interface_ios
//
//  Created by Larisa on 28.03.2022.
//

import UIKit

class FriendsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var friendsArray = [Friend]()
    let reuseIdentifier = "reuseIdentifier"
    let fromFriendsToGallery = "fromFriendsToGallery"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: reuseIdentifier)
        createFriendsArray()
        tableView.reloadData()

    }
    
    func createFriendsArray() {
        
        let friend1 = Friend(name: "Julia", avatar: "1", fotos: ["1", "2"])
        friendsArray.append(friend1)
        
        let friend2 = Friend(name: "Anna", avatar: "2", fotos: ["3", "4", "5"])
        friendsArray.append(friend2)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == fromFriendsToGallery {
            guard let destinationVC = segue.destination as? GalleryViewController,
                  let fotoArray = sender as? [String]
            else {return}
            
            destinationVC.fotoArray = fotoArray
        }
    }
}



extension FriendsViewController: UITableViewDelegate  {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected \(friendsArray[indexPath.row].name) group")
        performSegue(withIdentifier: fromFriendsToGallery, sender: friendsArray[indexPath.row].fotos)
    }
}

extension FriendsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? CustomTableViewCell else {return UITableViewCell()}
        
        cell.configure(friend: friendsArray[indexPath.row])
        return cell
    }
}


