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
        
        let friend1 = Friend(name: "Leo", avatar: "friend1", fotos: ["1.1", "1.2", "1.3", "1.4", "1.5", "1.6", "1.7", "1.8", "1.9", "1.10"])
        friendsArray.append(friend1)
        
        let friend2 = Friend(name: "Bred", avatar: "friend2", fotos: ["2.1", "2.2", "2.3", "2.4", "2.5", "2.6", "2.7", "2.8", "2.9", "2.10"])
        friendsArray.append(friend2)
        
        let friend3 = Friend(name: "Serg", avatar: "friend3", fotos: ["3.1", "3.2", "3.3", "3.4", "3.5", "3.6", "3.7", "3.8", "3.9", "3.10"])
        friendsArray.append(friend3)
        
        let friend4 = Friend(name: "Jenny", avatar: "friend4", fotos: ["4.1", "4.2", "4.3", "4.4", "4.5", "4.6", "4.7", "4.8", "4.9", "4.10"])
        friendsArray.append(friend4)
        
        let friend5 = Friend(name: "Karl", avatar: "friend5", fotos: ["5.1", "5.2", "5.3", "5.4", "5.5", "5.6", "5.7", "5.8", "5.9", "5.10"])
        friendsArray.append(friend5)
        
        let friend6 = Friend(name: "Angela", avatar: "friend6", fotos: ["6.1", "6.2", "6.3", "6.4", "6.5", "6.6", "6.7", "6.8", "6.9", "6.10"])
        friendsArray.append(friend6)
        
        let friend7 = Friend(name: "Tommy", avatar: "friend7", fotos: ["7.1", "7.2", "7.3", "7.4", "7.5", "7.6", "7.7", "7.8", "7.9", "7.10"])
        friendsArray.append(friend7)
        
        let friend8 = Friend(name: "Robert", avatar: "friend8", fotos: ["8.1", "8.2", "8.3", "8.4", "8.5", "8.6", "8.7", "8.8", "8.9", "8.10"])
        friendsArray.append(friend8)
        
        let friend9 = Friend(name: "Kate", avatar: "friend9", fotos: ["9.1", "9.2", "9.3", "9.4", "9.5", "9.6", "9.7", "9.8", "9.9", "9.10"])
        friendsArray.append(friend9)
        
        let friend10 = Friend(name: "Sandra", avatar: "friend10", fotos: ["10.1", "10.2", "10.3", "10.4", "10.5", "10.6", "10.7", "10.8", "10.9", "10.10"])
        friendsArray.append(friend10)
        
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


