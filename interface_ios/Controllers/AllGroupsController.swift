//
//  AllGroupsController.swift
//  interface_ios
//
//  Created by Larisa on 22.03.2022.
//

import UIKit

class AllGroupsController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
   let reuseIdentifier = "reuseIdentifier"
    var groupsArray = [Group]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: reuseIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        createGroupsArray()
        tableView.reloadData()
    }
    
    func createGroupsArray() {
        
        let group1 = Group(avatarImagePath: "1", name: "Snail", description: "I'm little Snail")
        groupsArray.append(group1)
        
        let group2 = Group(avatarImagePath: "2", name: "Alien", description: "I'm little Alien")
        groupsArray.append(group2)
        
        let group3 = Group(avatarImagePath: "3", name: "Penguin", description: "I'm little Penguin")
        groupsArray.append(group3)
        
        let group4 = Group(avatarImagePath: "4", name: "Kitty", description: "I'm little Kitty")
        groupsArray.append(group4)
        
        let group5 = Group(avatarImagePath: "5", name: "Tree", description: "I'm little Tree")
        groupsArray.append(group5)
    }

}

extension AllGroupsController: UITableViewDelegate  {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected \(groupsArray[indexPath.row].name) group")
    }
}

extension AllGroupsController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupsArray.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? CustomTableViewCell else {return UITableViewCell()}
        
        cell.configure(group: groupsArray[indexPath.row])
        return cell
    }
    
    
}
